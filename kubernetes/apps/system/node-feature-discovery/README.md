# Use TP Link USB bluetooth adapter

## 1. Add firmware

```shell
sudo apt install firware-realtek bluez usbutils
```

## 2. Add TP Link bluetooth adapter

$ sudo dmesg -T

```shell
[Mon Feb  3 11:48:41 2025] usb 2-2.1: new full-speed USB device number 7 using uhci_hcd
[Mon Feb  3 11:48:42 2025] usb 2-2.1: New USB device found, idVendor=2357, idProduct=0604, bcdDevice= 2.00
[Mon Feb  3 11:48:42 2025] usb 2-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[Mon Feb  3 11:48:42 2025] usb 2-2.1: Product: TP-Link UB5A Adapter
[Mon Feb  3 11:48:42 2025] usb 2-2.1: Manufacturer:
[Mon Feb  3 11:48:42 2025] usb 2-2.1: SerialNumber: E848B8C84000
[Mon Feb  3 11:48:42 2025] Bluetooth: hci0: RTL: examining hci_ver=0a hci_rev=000b lmp_ver=0a lmp_subver=8761
[Mon Feb  3 11:48:42 2025] Bluetooth: hci0: RTL: rom_version status=0 version=1
[Mon Feb  3 11:48:42 2025] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_fw.bin
[Mon Feb  3 11:48:42 2025] bluetooth hci0: firmware: direct-loading firmware rtl_bt/rtl8761bu_fw.bin
[Mon Feb  3 11:48:42 2025] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_config.bin
[Mon Feb  3 11:48:42 2025] bluetooth hci0: firmware: direct-loading firmware rtl_bt/rtl8761bu_config.bin
[Mon Feb  3 11:48:42 2025] Bluetooth: hci0: RTL: cfg_sz 6, total sz 27814
[Mon Feb  3 11:48:42 2025] Bluetooth: hci0: RTL: fw version 0x09a98a6b
```

## 3. Config node-feature-discovery

## 4. View labels

$ kubectl get nodes -o json | jq '.items[].metadata.labels'

```shell
"feature.node.kubernetes.io/usb-03_0e0f_0003.present": "true"
```
