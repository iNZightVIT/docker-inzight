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

### Linux

Remember the `sudo` command:
```
docker run -i -t --rm \
  -e DISPLAY=$DISPLAY \
  -u docker \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  inzight:latest
```

### Mac 

Because "Apple", there's a few more steps required (sorry!!)

We assume you've got it already, but you'll need to install docker if you haven't.

1. Install XQuartz from https://www.xquartz.org/
2. Start XQuartz (use spotlight to find it)
  - Go to Preferences > Security, and ensure the 'Allow connections from network clients' checkbox is ... checked!
3. **Restart** XQuartz (quick and reopen)
4. Start docker (if it isn't already running)
5. Open terminal and run the following commands:
```
xhost + ${hostname}
export HOSTNAME=`hostname`
```
6. Have a go at starting iNZight (remember `sudo`):
```
docker run -i -t --rm \
  -e DISPLAY=${hostname}:0 \
  -u docker \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  inzight:latest
```

On macOS, you can open Docker preferences to control the number of CPUs and how much RAM allocation docker is given, which may affect the performance of iNZight.

## Cool, but how do I load data?

Docker runs iNZight in its own environment, but you can share directories with it. For example, you could share your `Documents` folder with iNZight so you can load and save data by adding `-v $HOME/Documents:/iNZightVIT` to the `docker run` command. So, like this:

```
docker run -i -t --rm \
  -e DISPLAY=$DISPLAY \ # this is different on macOS
  -u docker \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $HOME/Documents:/iNZightVIT \
  inzight:latest
```

Now you'll be able to see your files from iNZight.
