#!/bin/bash

SSH_DIR="$HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"

echo "🔧 Setting up SSH directory..."
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [ -f "id_rsa.pub" ]; then
    echo "📤 Adding public key to authorized_keys..."
    cat id_rsa.pub >> "$AUTHORIZED_KEYS"
    chmod 600 "$AUTHORIZED_KEYS"
else
    echo "❌ Public key (id_rsa.pub) not found! Exiting."
    exit 1
fi

if ! sudo systemsetup -getremotelogin | grep -q "On"; then
    echo "🔑 Enabling Remote Login (SSH)..."
    sudo systemsetup -setremotelogin on
fi

echo "✅ SSH setup is complete! You can now connect."
