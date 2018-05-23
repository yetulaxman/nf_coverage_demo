
// Defines pipeline parameters 
params.bam_folder = null
params.bed = null

// The bed file
bed = file(params.bed)

// Creates the `bam` channel
bam = Channel.fromPath( params.bam_folder+'/*.bam' )

// Step 1. launch bedtools software to calculate coverage at each position of the bed
process coverage {

    input:
    file bam
    file bed  
      
    output:
    file 'coverage.txt' into coverage
        
    shell:
    '''
    bedtools coverage -d -a !{bed} -b !{bam} > coverage.txt
    '''
}

// Step 2. launch custom awk script to calculate the mean coverage
process mean {

    input:
    file coverage
      
    output:
    stdout average
        
    shell:
    '''
    awk '{ sum += $6 } END { if (NR > 0) print sum / NR }' !{coverage}
    '''
}
// collect output of all means to a single file
all_average = average.collectFile(name: 'all_average.txt')

// Step 3: plot histogram of mean coverage using a custom R script
process plot {

    input:
    file all_average
      
    output:
    file 'coverage.pdf'
        
    publishDir '.', mode: 'move' 
        
    shell:
    '''
    #!/usr/bin/env Rscript
    libray(ggplot2)
    pdf("coverage.pdf")
    data=read.table("all_average.txt")
    ggplot(data, aes(x=V1)) + geom_histogram(aes(y=..density..), colour="black", fill="grey") + geom_density(alpha=.2, fill="#FF6666")
    dev.off()
    '''
}
