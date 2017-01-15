# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

# In case of "rejecting i/o input from offline devices" error in
# guest machine change:
# - kernel type from linux to ubuntu64
# - change cpu count to 1
# - disable I/O APIC feature

# In case out of memory create swapfile:
# sudo fallocate -l 1G /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
# echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# MySQL root's password is "pw"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  
  config.vm.boot_timeout = 600
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "800"
  end
  
  # Permit write to temporary folders by web server.
  #config.vm.synced_folder "web/sites/default/files", "/vagrant/web/sites/default/files", owner: "www-data", group: "www-data"
  
  config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install -y apache2 libapache2-mod-php php-zip php-curl php-mysql php-xdebug php-gd php-xml git
     debconf-set-selections <<< "mysql-server mysql-server/root_password password pw"
     debconf-set-selections <<< "mysql-server mysql-server/root_password_again password pw"
     apt-get install -y --no-install-recommends mysql-server mysql-client
     a2enmod rewrite
     if ! [ -L /var/www/html ]; then
        rm -rf /var/www/html
        ln -sf /vagrant /var/www/html
     fi
     cd /home/ubuntu || exit
     curl -sS https://getcomposer.org/installer | php
     mkdir -p .local/bin
     mv composer.phar .local/bin/composer
     chmod +x .local/bin/composer
     chown ubuntu.ubuntu -R .local
     ( grep .local/bin .profile >/dev/null ) || \
        ( echo 'PATH="$PATH:$HOME/.local/bin"' >> .profile )
     echo 'PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> .profile
     cd /etc/php/7.0/mods-available || exit
     echo 'xdebug.remote_enable=1' >> xdebug.ini
     echo 'xdebug.remote_connect_back=1' >> xdebug.ini
     echo 'xdebug.remote_port=9000' >> xdebug.ini
     echo 'xdebug.idekey=netbeans-xdebug' >> xdebug.ini
     phpdismod -s cli xdebug
     service apache2 restart
  SHELL
end
