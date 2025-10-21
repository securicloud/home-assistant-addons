#!/bin/sh
CONFIG_PATH=/data/options.json

echo "[Securicloud Agent] Starting container..."
echo "[Securicloud Agent] Loading options..."
echo

SECURICLOUD_AGENT_DEBUG=$(jq -r '.debug' $CONFIG_PATH)

export SECURICLOUD_AGENT_DEBUG

echo "[Securicloud Agent] Launching Python..."
exec python3 -u securicloud_agent.py
