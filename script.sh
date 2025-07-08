#!/bin/bash

# Path to the directory where the symlinks should go
DEST_DIR="/lib/firmware/brcm"

# List of symlinks in the format: link -> target
declare -A symlinks=(
    ["BCM-0a5c-6410.hcd"]="BCM-0bb4-0306.hcd"
    ["BCM43430A1.raspberrypi,3-model-b.hcd"]="BCM43430A1.hcd"
    ["BCM43430A1.raspberrypi,model-zero-2-w.hcd"]="../synaptics/SYN43430A1.hcd"
    ["BCM43430A1.raspberrypi,model-zero-w.hcd"]="BCM43430A1.hcd"
    ["BCM43430B0.raspberrypi,model-zero-2-w.hcd"]="../synaptics/SYN43430B0.hcd"
    ["BCM4345C0.raspberrypi,3-model-a-plus.hcd"]="BCM4345C0.hcd"
    ["BCM4345C0.raspberrypi,3-model-b-plus.hcd"]="BCM4345C0.hcd"
    ["BCM4345C0.raspberrypi,4-compute-module.hcd"]="BCM4345C0.hcd"
    ["BCM4345C0.raspberrypi,4-model-b.hcd"]="BCM4345C0.hcd"
    ["BCM4345C0.raspberrypi,5-model-b.hcd"]="BCM4345C0.hcd"
    ["BCM4345C5.raspberrypi,400.hcd"]="BCM4345C5.hcd"
    ["BCM4345C5.raspberrypi,4-compute-module.hcd"]="BCM4345C5.hcd"
    ["brcmfmac43012-sdio.bin"]="../cypress/cyfmac43012-sdio.bin"
    ["brcmfmac43012-sdio.clm_blob"]="../cypress/cyfmac43012-sdio.clm_blob"
    ["brcmfmac43340-sdio.bin"]="../cypress/cyfmac43340-sdio.bin"
    ["brcmfmac43362-sdio.bin"]="../cypress/cyfmac43362-sdio.bin"
    ["brcmfmac43362-sdio.lemaker,bananapro.txt"]="brcmfmac43362-sdio.cubietech,cubietruck.txt"
    ["brcmfmac4339-sdio.bin"]="../cypress/cyfmac4339-sdio.bin"
    ["brcmfmac43430-sdio.bin"]="../cypress/cyfmac43430-sdio.bin"
    ["brcmfmac43430-sdio.raspberrypi,3-model-b.bin"]="../cypress/cyfmac43430-sdio.bin"
    ["brcmfmac43430-sdio.raspberrypi,3-model-b.txt"]="brcmfmac43430-sdio.txt"
    ["brcmfmac43430-sdio.raspberrypi,model-zero-w.bin"]="../cypress/cyfmac43430-sdio.bin"
    ["brcmfmac43430-sdio.raspberrypi,model-zero-w.txt"]="brcmfmac43430-sdio.txt"
    ["brcmfmac43430-sdio.raspberrypi,model-zero-2-w.bin"]="brcmfmac43436s-sdio.bin"
    ["brcmfmac43430-sdio.raspberrypi,model-zero-2-w.txt"]="brcmfmac43436s-sdio.txt"
    ["brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.bin"]="brcmfmac43436-sdio.bin"
    ["brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.clm_blob"]="brcmfmac43436-sdio.clm_blob"
    ["brcmfmac43430b0-sdio.raspberrypi,model-zero-2-w.txt"]="brcmfmac43436-sdio.txt"
)

echo "Creating symlinks in $DEST_DIR..."
cd "$DEST_DIR" || exit 1

for link in "${!symlinks[@]}"; do
    target="${symlinks[$link]}"
    echo "ln -sf $target $link"
    ln -sf "$target" "$link"
done

echo "All symlinks were created."