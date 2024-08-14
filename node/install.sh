#!/bin/bash
# Install script for GateChain
#   - CLI (gatecli)
#   - Full Node client (gated)
#   - Installs   prod

# Note: this is based on current structure of `node-binary` repo, which is not optimal
# - The installer script is a hack to simplify the installation process
# - Our binaries should eventually be refactor into a `apt` or `npm` repo, which features upgradability
# - We should not rely on folders for addressing (instead use git branches for versions)

# Detect operating system
# Future Improvement: Refactor into helper function
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  DETECTED_OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DETECTED_OS="mac"
elif [[ "$OSTYPE" == "cygwin" ]]; then
  DETECTED_OS="linux"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  DETECTED_OS="linux"
else
  echo "Error: unable to detect operating system. Please install manually by referring to $DOCS_WEB_LINK"
  exit 1
fi

# Check for existence of wget
if [ ! -x /usr/bin/wget ]; then
  # some extra check if wget is not installed at the usual place
  command -v wget >/dev/null 2>&1 || {
    echo >&2 "Error: you need to have wget installed and in your path. Use brew (mac) or apt (unix) to install wget"
    exit 1
  }
fi

BIN_VERSION=1.1.6
 

echo "========== Gate Chain Node Installation =========="
echo "Installer Version: v${BIN_VERSION}"
echo "Detected OS: $DETECTED_OS"
echo "====================================================="



# Install location
USR_LOCAL_BIN="/usr/local/bin"
# Note: /usr/local/bin choice from https://unix.stackexchange.com/questions/259231/difference-between-usr-bin-and-usr-local-bin
# Future improvement: needs uninstall script (brew uninstall) that removes executable from bin

# Choose Full Node Directory
#read -e -p "Choose home directory for Full Node [default: ~/.gated]:" GATECHAIN_FULLNODE_DIR
GATECHAIN_FULLNODE_DIR=${GATECHAIN_FULLNODE_DIR:-"$HOME/.gated"}

# Choose GATECLI directory
#read -e -p "Choose home directory for CLI [default: ~/.gatecli]:" GATE_CLI_DIR
GATE_CLI_DIR=${GATE_CLI_DIR:-"$HOME/.gatecli"}


# Detect previous installation and create .gated folder,
echo "... creating $GATECHAIN_FULLNODE_DIR"
if [ -d "$GATECHAIN_FULLNODE_DIR" ]; then
  echo "... Warn: GateChain Fullnode has already been installed "
else
  mkdir -p $GATECHAIN_FULLNODE_DIR
  cd $GATECHAIN_FULLNODE_DIR
fi
if [ -f "$USR_LOCAL_BIN/gated" ]; then
  echo "... Warn: Gate Chain Fullnode has already been installed"
  echo "... Warn: The old version exists ,you need to remove it and use the latest version instead of it"
fi
if [ -f "$USR_LOCAL_BIN/gatecli" ]; then
  echo "... Warn: Gate Chain CLI Mainnet has already been installed"
  echo "... Warn: The old version exists ,you need to remove it and use the latest version instead of it"
fi

# Version selection options
# Future improvement: pull dynamically from version list


# File Download URLs
GH_REPO_URL="https://media.githubusercontent.com/media/gatechain/node-binary/master/node/mainnet/${BIN_VERSION}"
CLI_FILENAME="gatecli"

# Download  Mainnet CLI
 
  CLI_BINARY_URL="$GH_REPO_URL/$DETECTED_OS/$CLI_FILENAME"
    cd $USR_LOCAL_BIN
    echo "... Downloading" $CLI_FILENAME 
    wget -q --show-progress "$CLI_BINARY_URL"
    chmod 755 "./$CLI_FILENAME"



# Download Full Node
NODE_FILENAME="gated"
FULLNODE_BINARY_URL="$GH_REPO_URL/$DETECTED_OS/$NODE_FILENAME"
    cd $USR_LOCAL_BIN
    echo "... Downloading" $NODE_FILENAME 
    wget -q --show-progress "$FULLNODE_BINARY_URL"
    chmod 755 "./$NODE_FILENAME"

FULLNODE_CONFIG_URL="https://raw.githubusercontent.com/gatechain/node-binary/master/node/mainnet/${BIN_VERSION}/config"

cd $GATECHAIN_FULLNODE_DIR
echo "... Downloading config files for full node"
wget -q --show-progress "$FULLNODE_CONFIG_URL/config.json"
wget -q --show-progress "$FULLNODE_CONFIG_URL/genesis.json"



# exit 1

# Add installed version of Gate Chain to path
echo "... Installation successful!"
echo "... \`gatecli\`, \`gated\`, added to $USR_LOCAL_BIN"
