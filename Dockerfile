# from node image
FROM node:erbium

MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>

ARG JBROWSE_VERSION=1.16.9
ARG SAMTOOLS_VERSION=1.10
ARG HTSLIB_VERSION=1.10.2

# Handle dependencies
RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential git zlib1g-dev && \
	 apt-get clean && echo -n > /var/lib/apt/extended_states

RUN mkdir -p /soft/bin

RUN wget -q https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
	tar jxf samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
	cd samtools-${SAMTOOLS_VERSION} && \
	make prefix=/soft/samtools install && \
	cd /soft/bin && ln -s /soft/samtools/bin/* . && cd /soft && \
	rm -rf *tar.bz2

RUN wget -q https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 && \
	tar jxf htslib-${HTSLIB_VERSION}.tar.bz2 && \
	cd htslib-${HTSLIB_VERSION} && \
	make prefix=/soft/htslib install && \
	cd /soft/bin && ln -s /soft/htslib/bin/* . && cd /soft && \
	rm -rf *tar.bz2

# PATH
ENV PATH $PATH:/soft/bin

RUN mkdir -p /srv

WORKDIR /srv

RUN git clone https://github.com/gmod/jbrowse

WORKDIR /srv/jbrowse

RUN git checkout ${JBROWSE_VERSION}-release # or version of your choice

# Volume 
VOLUME /srv/jbrowse/data
RUN rm -f /srv/jbrowse/jbrowser.conf
VOLUME /srv/jbrowse/jbrowser.conf

RUN ./setup.sh

EXPOSE 8082
CMD npm run start
