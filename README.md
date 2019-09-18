# jbrowse_docker
Docker installation of JBrowse

Running container:

    docker run -d -v /data/repos/annowiki/genomes/hoverfly/db:/srv/jbrowse/data -v /data/repos/annowiki/genomes/hoverfly/jbrowse/jbrowse.conf:/srv/jbrowse/jbrowse.conf -p 8082:8082 jbrowse

