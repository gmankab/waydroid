#!/bin/sh

echo test
sudo waydroid --details-to-stdout init --system_channel=https://ota.waydro.id/system --vendor_channel=https://ota.waydro.id/vendor
sudo waydroid --details-to-stdout container start

