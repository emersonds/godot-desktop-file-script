#!/usr/bin/env bash

# A script to install Godot and create a related .Desktop file

# Author: Dylan Emerson


# Default directories
icon_dir=".icons"
desktop_file_dir=".local/share/applications"

# Prompt user for Godot release version
read -p "Enter a stable release version of Godot (4.4.1, 4.3, etc): " version

# Define download archive URL with targeted release
filename="Godot_v$version-stable_linux.x86_64.zip"
download_url="https://github.com/godotengine/godot-builds/releases/download/$version-stable/$filename"
download_dir="Godot/$version-stable"

echo "Downloading Godot version $version to ~/$download_dir..."

# Create download directory
cd ~/
mkdir -p "$download_dir"
cd "$download_dir" || exit 1

# Download Godot and verify installation
curl -LO "$download_url"

if [ ! -f "$filename" ];
then
    echo "Download failed. Please verify if version $version exists."
    exit 1
fi

# Unzip and remove zip file
unzip -o "$filename"
rm $filename

# Verify Godot exe exists and make it executable
godot_exe="Godot_v$version-stable_linux.x86_64"
if [ ! -f "$godot_exe" ]
then
    echo "Godot executable not found after extraction. Please try again."
    exit 1
fi

chmod +x $godot_exe