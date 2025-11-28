# Archive Mode RPC Node

Archive mode keeps all historical state data and requires more disk space.

## Configuration

- **Sync Mode**: `full`
- **GC Mode**: `archive` (keeps all historical state)

⚠️ **Note**: Archive mode requires significant disk space (typically 1-5 TB), please ensure you have sufficient storage.

## Quick Start

### 1. Create `.env` file

Copy the example configuration file:

```bash
cd scripts/rpc/archive
cp .env.example .env
```

### 2. Edit `.env` file

Modify the configuration as needed:

```bash
# Edit configuration file
nano .env
# or
vim .env
```

### 3. Start Services

```bash
# Start directly, Docker Compose will automatically load .env file
docker compose up -d
```

### 4. Stop Services

```bash
docker compose down
```

## Usage (Without .env file)

If you prefer not to use `.env` file, you can export environment variables directly:

```bash
export DOCKER_USER=gatechain
export REGISTRY=ghcr.io/
export L1_RPC_URL=https://evm.nodeinfo.cc
export L1_BEACON_URL=https://api.nodeinfo.cc
export SEQUENCER_HTTP_URL=https://gatelayer-seq-mainnet.gatenode.cc

docker compose up -d
```

## Common Commands

### View Logs

```bash
docker compose logs -f
```

### Check Status

```bash
docker compose ps
```

### Restart Services

```bash
docker compose restart
```

### View Service Logs (Individual Service)

```bash
docker compose logs -f gatelayer-geth
docker compose logs -f gatelayer-node
```

## Environment Variables

### Required Environment Variables

- `DOCKER_USER`: Docker username or organization name
- `L1_RPC_URL`: L1 RPC endpoint
- `L1_BEACON_URL`: L1 Beacon API endpoint
- `SEQUENCER_HTTP_URL`: Sequencer HTTP endpoint

### Optional Environment Variables

- `GATELAYER_WORKSPACE`: Workspace directory (default: `/tmp/gatelayer`)
- `REGISTRY`: Docker registry (default: `ghcr.io/`)
- `TAG`: Image tag (default: `latest`)
- `DOCKER_PLATFORM`: Target platform (e.g., `linux/amd64`)
- `L2_CHAIN_ID`: L2 chain ID (default: `10088`)

## Advantages

Benefits of using `.env` file:

1. ✅ **No need to export every time**: Configure once, use forever
2. ✅ **Version control friendly**: `.env.example` can be committed to Git, `.env` can be added to `.gitignore`
3. ✅ **Centralized configuration**: All configuration in one file
4. ✅ **Easy environment switching**: Can create different `.env` files for different environments
