FROM ubuntu:16.04
MAINTAINER Murali <b.murali@gatech.edu>

RUN apt-get update > /dev/null && \
    apt-get install -y -q apt-utils wget bzip2 gcc build-essential git > /dev/null

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda > /dev/null && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN conda install -y scikit-learn pandas jupyter gensim nltk > /dev/null
RUN conda install -y matplotlib > /dev/null
RUN conda install -y pytorch torchvision -c soumith > /dev/null
