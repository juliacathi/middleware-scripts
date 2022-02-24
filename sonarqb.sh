#!/bin/bash


#description: "sonarqube configuration"

#author: julienne, Feb 2022


echo "SonarQube installation and configuration in progress"

echo
echo "java 11 installation"
echo
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
sleep 2
echo
echo " Download SonarQube latest versions on the server"
echo
 cd /opt
  sudo yum install wget -y
  sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
  sleep 2
  echo
  echo "extract packages"
  echo
  sudo yum install unzip -y
  sudo unzip /opt/sonarqube-9.3.0.51899.zip
  echo
  sleep 2
  echo "change ownership to the user"
  sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
  cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
  ./sonar.sh start
  sleep 2
  echo
  echo "connect to SonarQube"
  sudo firewall-cmd --permanent --add-port=9000/tcp
  sudo firewall-cmd --reload
  echo
  echo " open firewalld"
  echo
  sleep 2
  systemctl start firewalld
  systemctl enable firewalld
  systemctl status firewalld


  
