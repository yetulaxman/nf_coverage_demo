#!/usr/bin/env nextflow

greets = Channel.from("Moi", "Ciao", "Hello", "Hola","Bonjour")

process sayHello {

  publishDir 'results'

  input:
    val greet from greets

  output:
    file "${greet}.txt" into greetingFiles

  script:
    """
    echo ${greet} > ${greet}.txt
    """
}
