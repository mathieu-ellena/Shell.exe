sudo apt-get install ssh -y
sudo apt-get install proftpd-* -y

cpwd1=$(perl -e 'print crypt("kalimac" , "salt")')
cpwd2=$(perl -e 'print crypt("secondbreakfast" , "salt")')

sudo useradd -m -p $cpwd Merry
sudo useradd -m -p $cpwd Pippin
cd /etc/proftpd
cd proftpd.conf proftpd.conf.save
echo "<Anonymous ~ftp>
User ftp
Group nogroup
UserAlias anonymous ftp
DirkFakeUser on ftp
DirFakeGroup on ftp
RequireValidShell off
Maxclients 10
DisplayLogin welcome.msg
DisplayChdir .message

<Directory *>
<Limit WRITE>
AllowAll
</Limit>
</Directory>

<Directory incoming>
<Limit READ WRITE>
AllowAll
</Limit>
</Directory>
</Anonymous<

">> proftpd.conf

sudo systemctl restart proftpd
sudo systemctl status proftpd
