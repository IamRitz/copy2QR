#!/usr/bin/env bash

# Script to generate a QR code from clipboard content and display/save it.
# Dependencies: xclip, qrencode, fim

# Ensure required tools are installed
if ! command -v xclip &> /dev/null || ! command -v qrencode &> /dev/null || ! command -v fim &> /dev/null; then
    echo "Error: Please install 'xclip', 'qrencode', and 'fim' before running this script." >&2
    exit 1
fi

# Retrieve clipboard content
# clipboard_content = $(xclip -o -selection clipboard)
clipboard_content=$(xclip -o)

# Validate clipboard content
if [ -z "$clipboard_content" ]; then
    echo "Error: Clipboard is empty!" >&2
    exit 1
fi

# Generate a unique filename in the temporary directory
temp_file=$(mktemp /tmp/qr_code_XXXXXX.png)

# Generate a high-resolution QR code
qrencode -o "$temp_file" -s 10 "$clipboard_content"

# Prompt to save the QR code
read -p "Save the QR code as a file? (y/N): " save_file

if [[ "$save_file" =~ ^[Yy]$ ]]; then
    read -p "Enter the filename (default: myclip.png): " filename
    filename=${filename:-myclip}

    # Validate the filename
    if [[ "$filename" =~ ^[a-zA-Z0-9_]+$ ]]; then
        save_path="$HOME/$filename.png"
        cp "$temp_file" "$save_path"
        echo "QR code saved at: $save_path"
    else
        echo "Error: Invalid filename! Only alphanumeric characters and underscores are allowed." >&2
    fi
fi

# Display the QR code in the terminal using framebuffer
# Use devour to swallow the terminal if executing from a terminal emulator
# devour fim -a "$temp_file"
fim -a "$temp_file"

# Optionally: Clean up temporary file
# rm "$temp_file"
