################## BASE IMAGE ######################
FROM continuumio/miniconda3:4.7.12

################## METADATA ######################

LABEL base_image="continuumio/miniconda3"
LABEL version="4.7.12"
LABEL software="nf_coverage_demo"
LABEL software.version="2.3"
LABEL about.summary="Container image containing all requirements for nf_coverage_demo"
LABEL about.home="http://github.com/IARCbioinfo/nf_coverage_demo"
LABEL about.documentation="http://github.com/IARCbioinfo/nf_coverage_demo/README.md"
LABEL about.license_file="http://github.com/IARCbioinfo/nf_coverage_demo/LICENSE.txt"
LABEL about.license="GNU-3.0"

################## MAINTAINER ######################
MAINTAINER Matthieu Foll <follm@iarc.fr>

################## INSTALLATION ######################

COPY environment.yml /
RUN apt-get update && apt-get install -y procps && apt-get clean -y
RUN conda env create -n nf_coverage_demo -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf_coverage_demo/bin:$PATH
