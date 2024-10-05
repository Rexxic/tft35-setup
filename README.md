# TFT Display Setup Script

This script automates the setup process for installing and configuring a TFT display on your Raspberry Pi.

## Prerequisites

- Ensure that your Raspberry Pi has internet access.
- This setup assumes you are using a Debian-based operating system (such as Raspbian).

## Steps

1. Clone this repository or download the `setup_tft.sh` script.
   
   ```bash
   git clone https://github.com/your-repo/tft-setup
   cd tft-setup
   ```

2. Make the script executable and run it:

```bash
bash
Code kopieren
chmod +x setup_tft.sh
./setup_tft.sh
```

3. The script will:

- Clone the necessary repository for the TFT drivers.
- Copy required files to the appropriate directories.
- Modify configuration files to enable the TFT display and SPI interface.
- Update the system and install required packages.
- Reboot the system to apply the changes.
