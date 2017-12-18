# Bitcoin-abe Docker Container

Have you ever wanted to browse a local testnet blockchain? Or perhaps you wanted to have an easy way to deploy docker containers running a blockchain browser?

[Bitcoin-abe](http://github.com/bitcoin-abe/bitcoin-abe) is like blockchain.io or blockerexplorer.com but you get to run its magic.

This is a dockerized image for bitcoin-abe. Use it to browse the blockchain.

## How do I make it work and stuff?

When you have docker running just run the command like this:

 ```shell
$ docker run -d --name abe -P -p 49001:80 \
    -v <PATH_TO_YOUR_BITCOIN_DIR>:/datadir poliver/bitcoin-abe
```

*This image includes `EXPOSE 80`, so we can remap a port (in the example above `49001`) in the docker host to port `80` in the container.*

Then just point your browser to http://dockerhost:49001

***Note to Linux Users**: `dockerhost` is your local IP address. `127.0.0.1`*

***Note to Mac or Windows Users**: `dockerhost` is typically `192.168.59.103`, but this can change based on your Oracle VirtualBox settings. You can always check for the IP address by running  `docker-machine ip` from the command line on Mac or Windows.*


## FAQ

### How do I point this at a testnet blockchain?

1. Run the reference client [Bitcoin-qt](https://bitcoin.org/en/download) from the command line like this:

    ```shell
    # Example on a Mac
    $ mkdir -p ~/localnet
    $ /Applications/Bitcoin-Qt.app/Contents/MacOS/Bitcoin-Qt \
        -regtest -dnsseed=0 -connect=<HOST>:<IP> \
        -datadir=./localnet/
    ```

2. Run this docker container, but mount your `localnet` folder mounted at `datadir`:

    ```shell
    # On a Mac.
    $ docker run -d --name abe -P -p 49001:80 \
        -v ~/localnet/regtest:/datadir poliver/bitcoin-abe
    ```

3. Point your browser at http://dockerhost:49001

***Note to Linux Users**: `dockerhost` is your local IP address. `127.0.0.1`*

***Note to Mac or Windows Users**: `dockerhost` is typically `192.168.59.103`, but this can change based on your Oracle VirtualBox settings. You can always check for the IP address by running  `docker-machine ip` from the command line on Mac or Windows.*


### How do I point this at the public blockchain?

1. Run the reference client [Bitcoin-qt](https://bitcoin.org/en/download), no need to run with special arguments

2. Run the docker container, but mount your bitcoin folder at `datadir` on the container:

    ```shell
    # on a Mac
    docker run -d --name abe -P -p 49001:80 \
        -v ~/Library/Application Support/Bitcoin:/datadir \
        poliver/bitcoin-abe

    # on Linux
    sudo docker run -d --name abe -P -p 49001:80 -v \
        ~/.bitcoin:/datadir poliver/bitcoin-abe

    # on Windows
    docker run -d --name abe -P -p 49001:80 -v \
        %AppData%/Bitcoin:/datadir poliver/bitcoin-abe
    ```
 
3. Point your browser at http://dockerhost:49001

***Note to Linux Users**: `dockerhost` is your local IP address. `127.0.0.1`*

***Note to Mac or Windows Users**: `dockerhost` is typically `192.168.59.103` or `192.168.99.100`, but this can change based on your Oracle VirtualBox settings. You can always check for the IP address by running  `docker-machine ip` from the command line on Mac or Windows.*

