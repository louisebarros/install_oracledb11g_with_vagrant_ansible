groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54323 oper
useradd -u 54321 -g oinstall -G dba,oper -p oracle123 oracle
mkdir -p /u01/app/oracle/product/11.2.0/db_1
mkdir -p /u01/app/oracle/oraInventory
mkdir -p /u01/app/oracle/oradata
mkdir -p /u01/app/oracle/flash_recovery_area
chown -R oracle:oinstall /u01
chmod -R 775 /u01

cat /vagrant/bash_profile.txt > /home/oracle/.bash_profile
cat /vagrant/addconfig.txt >> /etc/sysctl.conf
cat /vagrant/limits.txt >> /etc/security/limits.conf
/sbin/sysctl -e -p

#change selinux
echo "SELINUX=permissive" >> /etc/selinux/config
setenforce Permissive

#disable firewall
service iptables save
service iptables stop
chkconfig iptables off
