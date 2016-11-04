Appearance:
```
sudo add-apt-repository -u ppa:noobslab/icons
sudo add-apt-repository -u ppa:noobslab/themes

sudo apt install unity-tweak-tool
sudo apt install royal-gtk-theme ultra-flat-icons ultra-flat-theme
```

Fish command shell:
```
sudo apt install fish
```

Gedit useful plugins:
```
sudo apt install gedit-plugins
```

Web development tools (GIT, Svn, PHP without webserver):
```
sudo apt install git subversion
sudo apt install php5-cli php5-xdebug php5-mcrypt php5-imagick php5-sqlite
sudo apt install sqlite3
```

Actual nodejs version (4.x lts)
```
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
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
sudo apt-get purge fonts-tlwg-waree fonts-tlwg-umpush fonts-tlwg-typo fonts-tlwg-typist fonts-tlwg-typewriter fonts-tlwg-sawasdee fonts-tlwg-purisa fonts-tlwg-norasi fonts-tlwg-mono fonts-tlwg-loma fonts-tlwg-kinnari fonts-tlwg-garuda fonts-tibetan-machine fonts-thai-tlwg fonts-takao-pgothic fonts-sil-padauk fonts-sil-abyssinica fonts-nanum fonts-lklug-sinhala fonts-lao fonts-khmeros-core fonts-kacst-one fonts-kacst
```
