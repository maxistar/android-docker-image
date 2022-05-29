# Dockerfile to build an android applications

Simple docker image to compile android applications


## Build an image
`docker build -t maxistar/android .`

## Publish image
```
docker image tag maxistar/android maxistar/android:gradle_v7.3.1
docker image push maxistar/android:gradle_v7.3.1
docker image push maxistar/android:latest
```

## Start shell
`docker run -it maxistar/android:latest /bin/bash -l`

## Example of running gradle commands
```
docker run --rm -v ${PWD}:/var/app maxistar/android bash \
  -c "gradle build && gradle compileDebugSources"
```

