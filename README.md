# GateChain Client

GateChain is a novel next-generation public blockchain, focused on onchain asset safety and decentralized exchange. 

## Installation Script
We have a installer script (install.sh) that takes care of chain directory setup. This uses the following defaults:

* Home folder in ~/.gated
* Executable file is located at "/usr/local/bin"(that is:"gated" "gatecli")

```cassandraql
# One-line install
bash <(wget -qO- https://raw.githubusercontent.com/gatechain/node-binary/master/node/install.sh)
```

## Docker Installation
You can also run GateChain node using Docker. We provide official Docker images for easy deployment.

```bash
# Pull the latest GateChain node image
docker pull ghcr.io/gatechain/node-binary/gatechain:latest



## Manual Installation
We use the repository to store historical versions of the compiled node binary file for the time being. 
# Please follow the docs:

# [EN](http://docs.gatechain.io/en/developers/gatechain-build/)

# [中文](http://docs.gatechain.io/developers/gatechain-build/) -->
