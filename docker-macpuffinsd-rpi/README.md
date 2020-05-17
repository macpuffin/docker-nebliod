# docker-macpuffinsd-testnet
Docker Containers for macpuffinsd - testnet

macpuffins/buildpack-deps: A base Ubuntu 16.04 docker container with dependencies installed to build macpuffinsd

macpuffins/macpuffinsd-build: A container for building the latest version of macpuffinsd, and then syncing and saving the blockchain

macpuffins/macpuffinsd-testnet: The main macpuffinsd container that end users will use. Instantly launches and starts macpuffinsd with a fully-synced blockchain on testnet.

Quick Start
===========

Prerequisites: Any system with docker installed. https://docs.docker.com/engine/installation/

To launch a fully functional macpuffinsd node, with QuickSync simply run the following command:

    sudo docker run -i -t --rm --name macpuffinsd-testnet -v $HOME/macpuffins-data-testnet:/root/.macpuffins -p 18200:18200 macpuffins/macpuffinsd-testnet

Blockchain data and macpuffinsd configuration files will be persistently stored on the local machine at $HOME/macpuffins-data-testnet
