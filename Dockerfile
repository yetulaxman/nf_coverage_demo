################## BASE IMAGE ######################
FROM nfcore/base

################## METADATA ######################

LABEL base_image="nfcore/base"
LABEL version="2.1"
LABEL software="nf_coverage_demo"
LABEL software.version="2.1"
LABEL about.summary="Container image containing all requirements for nf_coverage_demo"
LABEL about.home="http://github.com/IARCbioinfo/nf_coverage_demo"
LABEL about.documentation="http://github.com/IARCbioinfo/nf_coverage_demo/README.md"
LABEL about.license_file="http://github.com/IARCbioinfo/nf_coverage_demo/LICENSE.txt"
LABEL about.license="GNU-3.0"

################## MAINTAINER ######################
MAINTAINER Matthieu Foll <follm@iarc.fr>

################## INSTALLATION ######################

COPY environment.yml /
RUN conda env update -n root -f /environment.yml && conda clean -a
