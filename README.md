# jbrowse_docker
Docker installation of JBrowse

    docker build -t jbrowse2 .

Built Docker can be found at [Docker Hub](https://hub.docker.com/r/biocorecrg/jbrowse).


Running container:

With Jbrowse2 it is actually not necessary to keep a running webservice, but for convenience we can keep it.

It's important to define a directory/volume where the different generated static files will be stored.

Here we expose the port ```8081```. Internal port ```8080``` will be always the same.

    docker run -d --name mybrowser -v /my/var/www:/var/www -v /my/data:/data -p 8081:8080 jbrowse2


## Build instructions

* From https://jbrowse.org/jb2/docs/superquickstart_web/

```
# Create - needs to be empty 
docker exec mybrowser bash -c 'cd /var/www; jbrowse create .'
# Then assembly. We symlink and we allow magic from container
docker exec mybrowser bash -c 'jbrowse add-assembly /data/Hm105_Dovetail_Assembly_1.0.fa --out /var/www --load symlink'
# Then all the different tracks with their names
docker exec mybrowser bash -c 'jbrowse add-track /data/ATAC/tentacles.mRp.clN.bigWig --name tentacles --out /var/www --load symlink'
# Index names and so
docker exec mybrowser bash -c 'jbrowse text-index --out /var/www'
```


# Plugins

* https://gmod.github.io/jbrowse-registry/
