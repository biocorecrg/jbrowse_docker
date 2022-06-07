# jbrowse_docker
Docker installation of JBrowse

    docker build -t jbrowse .

Built Docker can be found at [Docker Hub](https://hub.docker.com/r/biocorecrg/jbrowse).


Running container:

It's important to define a directory/volume where the different generated static files will be stored.

Here we expose the port ```8081```. Internal port ```8080``` will be always the same.

    docker run -d --name mybrowser -v /my/var/www:/var/wwww jbrowse.conf -v /my/data:/data -p 8081:8080 jbrowse


There are many ways to organize paths. It is important to be aware of them.

# Plugins

* https://gmod.github.io/jbrowse-registry/
