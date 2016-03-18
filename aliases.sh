alias itsWhalesAllTheWayDown='docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):$(which docker) '
alias itsGophersAllTheWayDown='itsWhalesAllTheWayDown -e "APPDIR=$(pwd)" -e "EXTERNAL_GOPATH=$GOPATH" -v $(pwd):/go/src/$(basename $(pwd)) --rm -it golang-dockerizer'
