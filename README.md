# discworld
Docker build in any Docker container

![catch!](https://github.ibm.com/afworm/discworld/blob/master/discworld.jpg?raw=true)

https://github.ibm.com/afworm/discworld/blob/master/discworld.jpg?raw=true

This is useful for having containers with your build tools 
and then creating a runtime container for your application
which is not polluted with the build tools and source code.

`alias itsWhalesAllTheWayDown='docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) '`

Launch your builder and run bash.

`itsWhalesAllTheWayDown --rm -it -v $(pwd):/myapp myapp-builder /bin/bash`

Or if you have a build script as the ENTRYPOINT

`itsWhalesAllTheWayDown -d -v $(pwd):/myapp myapp-builder ...args to your script...`

Now run your docker commands from within the docker container you are running. 
It will talk to the external docker-daemon and build your image externally.


Installation
----------------

Add the alias to your `.profile`, `.bash_profile`, or `.bashrc`


Minimal Golang Docker Image
---------------------------

`docker build -t golang-dockerizer .`

*this may be broken right now*

`alias itsGophersAllTheWayDown='itsWhalesAllTheWayDown -e "APPDIR=$(pwd)" -e "EXTERNAL_GOPATH=$GOPATH" -v $(pwd):$(pwd)) --rm -it golang-dockerizer'`

In your Golang project directory, create a Dockerfile like this:

```
FROM scratch

ADD GoappBinary /GoappBinary

ENTRYPOINT ["/GoappBinary"]

# include any other docker stuff you'd like
# ADD src/www /www
# EXPOSE 8080
# VOLUME /path/to/dir
```

Then run

`itsGophersAllTheWayDown <image-name>`

This will produce a Docker image with just your Golang app.


-- Image courtesy of https://ferrebeekeeper.files.wordpress.com/2015/03/discworld.jpg --