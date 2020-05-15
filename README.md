# docker-macpuffinsd
Docker Containers for macpuffinsd

macpuffins/buildpack-deps: A base Ubuntu 16.04 docker container with dependencies installed to build macpuffinsd

macpuffins/macpuffinsd-build: A container for building the latest version of macpuffinsd, and then syncing and saving the blockchain

macpuffins/macpuffinsd: The main macpuffinsd container that end users will use. Instantly launches and starts macpuffinsd with a fully-synced blockchain.

macpuffins/macpuffinsd-testnet: Instantly launches and starts macpuffinsd with a fully-synced blockchain on testnet.

Quick Start
===========

Prerequisites: Any system with docker installed. https://docs.docker.com/engine/installation/

To launch a fully functional macpuffinsd node, with QuickSync simply run the following command:

    sudo docker run -i -t --rm --name macpuffinsd -v $HOME/macpuffins-data:/root/.macpuffins -p 6325:6325 macpuffins/macpuffinsd

Blockchain data and macpuffinsd configuration files will be persistently stored on the local machine at $HOME/macpuffins-data
