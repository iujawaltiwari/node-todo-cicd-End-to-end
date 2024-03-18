#!/bin/bash

updatesystem() {

     echo "First Update the System"
     sudo apt update -y

}
install_java_jenkins() {

     echo "Install Java For Jenkins"
     sudo apt install fontconfig openjdk-17-jre

}
install_jenkins() {

     echo "Install Jenkins"
     sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
      https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
     echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
      https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
       /etc/apt/sources.list.d/jenkins.list > /dev/null

     echo "Update"
     sudo apt-get update -y
     sudo apt-get install jenkins -y

}
updatesystem
install_java_jenkins
install_jenkins
