## guide how to install android 13 (lineage 20) in waydroid


### cleanup

if you messed up your waydroid installation, you can clean it up

```
sudo systemctl stop waydroid-container.service
sudo rm -rf /etc/waydroid-extra /var/lib/waydroid /home/.waydroid ~/waydroid ~/.share/waydroid ~/.local/share/applications/*aydroid* ~/.local/share/waydroid
```

### run waydroid with android 11

in order to get android 13 working, first we should run waydroid with android 11

#### init waydroid

```shell
sudo waydroid init --system_channel=https://ota.waydro.id/system --vendor_channel=https://ota.waydro.id/vendor -f
sudo waydroid upgrade
```

#### start waydroid container service

```shell
sudo systemctl start waydroid-container
```

if it fails to start, try to disable selinux

```shell
sudo setenforce 0
sudo systemctl start waydroid-container
```

or you can try to start it without using systemd

```shell
sudo waydroid container start
```

#### launch waydroid

```shell
waydroid show-full-ui
```

### run waydroid with android 13

if you succeeded to start android 11, then you can try to start android 13

#### download android 13 images and init
```shell
sudo curl -L https://github.com/gmankab/waydroid/releases/download/jul-12-2024/system.img -o /etc/waydroid-extra/images/system.img --create-dirs
sudo curl -L https://github.com/gmankab/waydroid/releases/download/jul-12-2024/vendor.img -o /etc/waydroid-extra/images/vendor.img --create-dirs
sudo waydroid init -f -i /usr/share/waydroid-extra/images
```

#### start waydroid container service

```shell
sudo systemctl start waydroid-container
```

#### launch waydroid

```shell
waydroid show-full-ui
```

### go back to android 11

```shell
sudo systemctl stop waydroid-container.service
sudo rm -rf /etc/waydroid-extra /var/lib/waydroid /home/.waydroid ~/waydroid ~/.share/waydroid ~/.local/share/applications/*aydroid* ~/.local/share/waydroid
sudo waydroid init --system_channel=https://ota.waydro.id/system --vendor_channel=https://ota.waydro.id/vendor -f
sudo waydroid upgrade
```

# special thanks to

- @Benjamin-Loison for building android 13 image - https://github.com/Benjamin-Loison/waydroid/issues/16#issuecomment-2226210183
- waydroid developers
- lineage os developers

