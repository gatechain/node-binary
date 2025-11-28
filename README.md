# GateChain Node Binaries

This repository maintains the node binaries and installation scripts for:
- **GateChain**: A novel next-generation public blockchain focused on onchain asset safety.
- **GateLayer**: The Layer 2 scaling solution for GateChain. 

## GateChain L1 Node

### Installation Script
We have a installer script (install.sh) that takes care of chain directory setup. This uses the following defaults:

* Home folder in ~/.gated
* Executable file is located at "/usr/local/bin"(that is:"gated" "gatecli")

```cassandraql
# One-line install
bash <(wget -qO- https://raw.githubusercontent.com/gatechain/node-binary/master/gatechain/mainnet/node/install.sh)
```

### Docker Installation
You can also run GateChain node using Docker. We provide official Docker images for easy deployment.

```bash
# Pull the latest GateChain node image
docker pull ghcr.io/gatechain/node-binary/gatechain:latest
```

### Manual Installation
We use the repository to store historical versions of the compiled node binary file for the time being. 
<!-- Please follow the docs: -->

<!-- [EN](http://docs.gatechain.io/en/developers/gatechain-build/)

[中文](http://docs.gatechain.io/developers/gatechain-build/)  -->

## GateLayer L2 Node

GateLayer is the Layer 2 solution for GateChain.

### Docker Installation

We provide Docker Compose configurations for running GateLayer nodes.

* [Archive Node](gatelayer/mainnet/docker/archive/README.md)
* [Full Node](gatelayer/mainnet/docker/full/README.md)
