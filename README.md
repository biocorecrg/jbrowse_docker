# jbrowse_docker
Docker installation of JBrowse

Running container:

    docker run -d -v /data/repos/annowiki/genomes/hoverfly/db:/srv/jbrowse/data -v /data/repos/annowiki/genomes/hoverfly/jbrowse/jbrowse.conf:/srv/jbrowse/jbrowse.conf -p 8082:8082 jbrowse

Example:


    docker exec container /srv/jbrowse/bin/flatfile-to-json.pl --trackType CanvasFeatures --type CDS  --trackLabel hoverfly_CDS --gff /srv/jbrowse/data/hoverfly.gff --workdir jbrowse/hoverfly

    docker exec container /srv/jbrowse/bin/prepare-refseqs.pl --workdir jbrowse/hoverfly --fasta /srv/jbrowse/data/hoverfly.assembly_scaffold.fa

    docker exec container /srv/jbrowse/bin/generate-names.pl -v --workdir jbrowse/hoverfly


# Plugins

* https://gmod.github.io/jbrowse-registry/

# TODO

* Remove install.sh part from Docker build
* Add elastic search plugin: https://github.com/elsiklab/jbrowse_elasticsearch
