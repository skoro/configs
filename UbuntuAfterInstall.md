Disable Apt's recommends packages:
```
sudo echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf.d/99local
```

Gedit useful plugins:
```
sudo apt install gedit-plugins
```

Web development tools (GIT, Svn, PHP without webserver):
```
sudo apt install git subversion
sudo apt install php-cli php-xdebug php-mcrypt php-imagick php-sqlite3 \
                 php-mbstring php-xml php-intl
sudo apt install sqlite3
```

Actual nodejs version (6.x lts)
```
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install nodejs
```

Oracle Java 8
```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install --no-install-recommends oracle-java8-installer
```

Android SDK fix:
```
sudo apt-get install lib32stdc++6 lib32z1
# Fix adb device permissions:
# Put below line to /etc/udev/rules.d/51-android.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="plugdev"
```

Fix Android emulator (libGL error: unable to load driver: r600_dri.so)
```
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
```

Chat:
```
sudo apt remove --purge empathy
sudo apt install pidgin
```

Save a notebook battery:
```
sudo apt install tlp
```

Remove exotic fonts:
```
sudo apt-get purge fonts-tlwg-\* fonts-tibetan-machine fonts-thai-tlwg \
     fonts-takao-pgothic fonts-sil-padauk fonts-sil-abyssinica fonts-nanum \
     fonts-lklug-sinhala fonts-lao fonts-khmeros-core fonts-kacst-one \
     fonts-kacst fonts-lohit-\* fonts-smc\* fonts-telu\* fonts-samyak-\* \
     fonts-sarai fonts-sahadeva fonts-pagul fonts-orya-extra fonts-noto-cjk \
     fonts-navilu fonts-nakula fonts-kalapi fonts-guru-extra fonts-beng-extra \
     fonts-gargi fonts-gubbi fonts-gujr-extra fonts-guru-extra fonts-kalapi
```

Enable bitmap fonts (for terminal emulator):
```
sudo apt install xfonts-terminus
cd /etc/fonts/conf.d
sudo rm -f 70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf .
sudo dpkg-reconfigure fontconfig
```
