# Ada/SPARK on ESP32-C3 Demo

## Introduction

Based on article: https://blog.adacore.com/embedded-ada-spark-theres-a-shortcut

## Prerequisites

- ESP-IDF v5.1 or later
```bash
git clone https://github.com/espressif/esp-idf.git --single-branch --depth 1 --shallow-submodules --recursive
cd esp-idf
./install.sh
source ./export.sh
```

- ALIRE from https://alire.ada.dev/

## Prepare

Update `CONFIG_EXAMPLE_WIFI_SSID` and `CONFIG_EXAMPLE_WIFI_PASSWORD` in `sdkconfig` to match your WiFi network.

Update `BLINK_GPIO` in `main.c` to match your board.
- set to 8 for ESP32-C3-DevKitM-1
- set to 2 for ESP32-C3-DevKit-RUST-1 - https://github.com/esp-rs/esp-rust-board#ios

## Build

```bash
cd esp32c3_https_server
idf.py build flash monitor
```

Open URL https://IP_ADDRESS/ in your browser.

Hit refresh to change the color of LED.
