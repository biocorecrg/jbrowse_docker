# jbrowse_docker
Docker installation of JBrowse

    docker build -t jbrowse .

Running container:

    docker run -d --name mybrowser -v /data/repos/annowiki/genomes/hoverfly/db:/srv/jbrowse/data -v /data/repos/annowiki/genomes/hoverfly/jbrowse/jbrowse.conf:/srv/jbrowse/jbrowse.conf -p 8082:8082 jbrowse

Example commands:


    docker exec mybrowser /srv/jbrowse/bin/flatfile-to-json.pl --trackType CanvasFeatures --type CDS  --trackLabel hoverfly_CDS --gff /srv/jbrowse/data/hoverfly.gff --out /srv/jbrowse/data/jbrowse/hoverfly

    docker exec mybrowser /srv/jbrowse/bin/prepare-refseqs.pl --out /srv/jbrowse/data/jbrowse/hoverfly --fasta /srv/jbrowse/data/hoverfly.assembly_scaffold.fa

    docker exec mybrowser /srv/jbrowse/bin/generate-names.pl -v --out /srv/jbrowse/data/jbrowse/hoverfly

    docker exec mybrowser /srv/jbrowse/bin/add-bw-track.pl --label whole_animal --bw_url ../../ATAC/whole_animal.mRp.clN.bigWig --in /srv/jbrowse/data/jbrowse/hoverfly/trackList.json --out /srv/jbrowse/data/jbrowse/hoverfly/trackList.json


# Plugins

* https://gmod.github.io/jbrowse-registry/

# TODO

* Remove install.sh part from Docker build
* Add elastic search plugin: https://github.com/elsiklab/jbrowse_elasticsearch
