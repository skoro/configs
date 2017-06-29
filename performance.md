## Linux performance tips

Do it under super user.

Reduce swap limit:
```
echo vm.swappiness=10 >> /etc/sysctl.conf
```

inode cache (for pc with more than 1gb):
```
echo vm.vfs_cache_pressure=50 >> /etc/sysctl.conf
```

### LibreOffice

Disable Java: Tools -> Options (or press `Alt-F12`)
Go to: LibreOffice -> Advanced. Disable checkbox **Use a Java runtime environment**.

### Services

```
systemctl disable avahi.service
systemctl disable cups-browsed.service
systemctl disable ModemManager.service
systemctl disable speech-dispatcher.service
systemctl disable ssh.service
```
