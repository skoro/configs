## Compile extensions on Ubuntu

Requirements before compiling any module:
```
sudo apt install build-essential php-pear php5-dev
```

### Event extension:
```
sudo pecl install ev
cd /etc/php5/mods-available
sudo editor ev.ini
```

Insert into ev.ini:
```
extension=ev.so
```

Enable module:
```
sudo php5enmod ev
php -m|grep ev
```


