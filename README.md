# TFT Display Setup Script

This script automates the setup process for installing and configuring a 3.5 inch display on your Raspberry Pi running Volumio OS.

## Prerequisites

- Flash Volumio OS to your Raspberry Pi SD-Card and set it up over the Browser.
- Ensure that your Raspberry Pi has internet access.
- Enable the Touch Display Plugin under `Plugins` -> `User Interface`.
- Connect to the PI via SSH or use a Keyboard and HDMI-Display.

## Steps

1. Clone this repository or download the `setup_tft.sh` script.
   
   ```bash
   wget https://raw.githubusercontent.com/Rexxic/tft35-setup/refs/heads/main/setup_tft.sh
   ```

2. Make the script executable and run it:

   ```bash
   chmod +x setup_tft.sh
   ./setup_tft.sh
   ```

3. The script will:

- Clone the necessary repository for the TFT drivers.
- Ask you for Display Orientation.
- Copy required files to the appropriate directories.
- Modify configuration files to enable the TFT display and SPI interface.
- Update the system and install required packages.
- Reboot the system to apply the changes.

## Cave

- Running the Script will make the PI inacessible over SSH. This means once set the display orientation cannot be altered, the display orientation setting of the plugin does not work with this setup.
