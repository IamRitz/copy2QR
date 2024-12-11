# QR Code Generator Utility

This is a Bash script to generate a QR code from clipboard content, display it
in the terminal, and optionally save it as a file. It is lightweight and
depends on a few external tools to function.

## Features
- Automatically reads text content from the clipboard.
- Generates a high-resolution QR code from the clipboard content.
- Optionally saves the QR code to a specified file.
- Displays the QR code in the terminal using framebuffer.

## Requirements
This script requires the following tools to be installed:
- **xclip**: To access clipboard content.
- **qrencode**: To generate QR codes.
- **fim**: To display QR codes in the terminal.

To install these tools on a Debian-based system, run:
```bash
sudo apt update && sudo apt install xclip qrencode fim
```

To install these tools on a Red Hat-based system, run:
```bash
sudo yum install xclip qrencode fim
```

To install these tools on an Arch-based system, run:
```bash
sudo pacman -S xclip qrencode fim
```

## Installation
1. Clone this repository or download the script directly:
   ```bash
   git clone https://github.com/yourusername/copy2qr.git
   cd copy2qr
   ```
2. Make the script executable:
   ```bash
   chmod +x qr_script.sh
   ```

## Usage
1. Copy the content you want to encode into the clipboard.
2. Run the script:
   ```bash
   ./qr_script.sh
   ```
3. Follow the prompts:
   - Choose whether to save the QR code as a file.
   - Provide a valid filename if saving is desired (default: `myclip.png`).
4. The QR code will be displayed in the terminal using `fim`.
5. Use -/+ to zoom in/out and q to quit the image viewer.

## i3 Keybinding
To bind the script to a key in i3, add the following line to your i3 config file
(`~/.config/i3/config`):
```bash
bindsym $mod+Shift+q exec /path/to/qr_script.sh
```

## Example
```bash
$ ./qr_script.sh
Save the QR code as a file? (y/N): y
Enter the filename (default: myclip.png): example_qr
QR code saved at: /home/user/example_qr.png
```
