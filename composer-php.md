composer (php) installation steps on Ubuntu
-------------------------------------------

Download composer:
```
curl -sS https://getcomposer.org/installer | php
```

Install composer to user's home:
```
mkdir ~/.local/bin
mv composer.phar ~/.local/bin/composer
chmod +x ~/.local/bin/composer
```

To expose composer's vendor bin directory open your `$HOME/.profile`
and add following lines to end of the file:
```
if [ -d "$HOME/.config/composer/vendor/bin" ]; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
```
Then logout and login to update your environment.

Install Drupal and Wordpress command line tools:
```
composer global require drush/drush
composer global require wp-cli/wp-cli
```

`drush` and `wp` will be available in your command line environment.
