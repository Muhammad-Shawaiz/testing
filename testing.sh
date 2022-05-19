
#!/bin/sh

echo "Hello World"
apt update
apt install apache2
systemctl start apache2
systemctl enable apache2
ufw app list
ufw allow 'Apache'
ufw status
systemctl status enp0s3
cd /var/www/html
git clone https://github.com/HasanNaser/My-Personel-Website
cp -r /var/www/html/My-Personel-Website/* .
rm -rf My-Personel-Website/
cp /etc/apache2/sites-available/000-default.conf  /etc/apache2/sites-available/page.conf
sed -i -e 's/#ServerName www.example.com/ServerName www.bbb.com/'  /etc/apache2/sites-available/page.conf
sed -i -e 's/ServerAdmin webmaster@localhost/ServerAdmin ahmed@bbb.com/' /etc/apache2/sites-available/page.conf
a2dissite 000-default.conf
a2ensite page.conf
systemctl restart apache2
echo "10.4.105.251  www.bbb.com  bbb.com " >> /etc/hosts
