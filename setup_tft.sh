#!/bin/bash

# Prompt the user for the desired orientation
echo "Please enter the display orientation for the TFT (valid values: 0, 90, 180, 270):"
read orientation

# Validate the user input
if [[ "$orientation" != "0" && "$orientation" != "90" && "$orientation" != "180" && "$orientation" != "270" ]]; then
    echo "Invalid orientation value. Please enter 0, 90, 180, or 270."
    exit 1
fi

# Clone the repository
echo "Cloning the LCD-show repository..."
git clone https://github.com/goodtft/LCD-show

# Set the correct permissions
echo "Setting permissions for the LCD-show directory..."
chmod -R 755 LCD-show

# Navigate to the necessary directory
cd LCD-show/usr

# Copy the TFT overlay file
echo "Copying TFT overlay to boot overlays..."
sudo cp tft35a-overlay.dtb /boot/overlays/tft35a.dtbo

# Copy the calibration file
echo "Copying calibration configuration..."
sudo cp -rf 99-calibration.conf-35-90 /etc/X11/xorg.conf.d/99-calibration.conf

# Ensure the X11 configuration directory exists
echo "Ensuring X11 configuration directory exists..."
sudo mkdir -p /usr/share/X11/xorg.conf.d/

# Copy the fbturbo configuration
echo "Copying fbturbo configuration..."
sudo cp -rf 99-fbturbo.conf /usr/share/X11/xorg.conf.d/99-fbturbo.conf

# Enable SPI and add the TFT overlay to the boot configuration
echo "Configuring boot settings for TFT..."

# Delete any existing dtoverlay=tft35a lines (with or without orientation)
sudo sed -i '/dtoverlay=tft35a/d' /boot/userconfig.txt

# Delete any existing dtparam=spi=on lines
sudo sed -i '/dtparam=spi=on/d' /boot/userconfig.txt

# Add the correct lines to the configuration file
echo "dtparam=spi=on" | sudo tee -a /boot/userconfig.txt
echo "dtoverlay=tft35a:${orientation}" | sudo tee -a /boot/userconfig.txt

# Modify the X11 configuration for fbturbo
echo "Modifying fbturbo configuration..."
sudo sed 's/"fbturbo"/"fbdev"/' -i /usr/share/X11/xorg.conf.d/99-fbturbo.conf

# Update the package list and install required package
echo "Updating system and installing necessary packages..."
sudo apt update
sudo apt install xserver-xorg-input-evdev -y

# Copy evdev configuration
echo "Copying evdev configuration..."
sudo cp /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

# Reboot to apply changes
echo "Rebooting the system..."
sudo reboot
