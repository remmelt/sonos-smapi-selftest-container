# Sonos smapi self test in a container

Run the Sonos Music API self test suite in a container!

Edit the configuration file according to the [documentation](https://musicpartners.sonos.com/?q=node/347).

Create the image using `make build`, then kick off the tests with `make run`.

Log files will end up in `./logs`.

## Docker on OSX to local machine workaround

If you want to use this container to run the test suite against an instance of SMAPI running on localhost using Mac OSX, you will not be able to connect to `localhost` from the container, even with `--network host`, since on OSX docker runs in a VM.

The workaround is to set the hostname to `host.docker.internal` in the config file. According to [the docker documentation](https://docs.docker.com/docker-for-mac/networking/#use-cases-and-workarounds) this is a special DNS name which resolves to the internal IP address used by the host.
