FROM biocontainers/biocontainers:latest
MAINTAINER Matthieu Foll <follm@iarc.fr>
RUN conda install bedtools=2.25.0
RUN conda install -c r r-base
