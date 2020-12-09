# Docker container for iNZight

Running iNZight requires quite a few dependencies. One way around that is to install one dependency (docker) and use that instead!

## Install

```
docker pull inzight/inzight:latest
```

Or build it yourself (using `sudo`):
```
# git clone https://github.com:iNZightVIT/docker.git
# cd docker
docker build --build-arg GITHUB_PAT=${GITHUB_PAT} -t inzight:latest .
```
where `GITHUB_PAT` is your own Github token (required for `remotes::install_github`).

## Run

This requires some X11 trickery...

On Linux (again using `sudo`):
```
docker run -i -t --rm \
  -e DISPLAY=$DISPLAY \
  -e GITHUB_PAT=$GITHUB_PATH \
  -u docker \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  inzight:latest
```
