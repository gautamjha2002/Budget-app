# installing jenkins on centos machine

# updating the packages
sudo yum update -y 

# installing wget and git
sudo yum install wget git -y

# getting the jenkins repo

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# importing jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# upgrading the package
sudo yum upgrade

# Addding required dependencies for the jenkins package

# Adding JAVA
sudo yum install java-11-openjdk -y

# installing jenkins
sudo yum install jenkins -y

# reloading daemon
sudo systemctl daemon-reload

# Starting Jenkins

# enabling jenkins
sudo systemctl enable jenkins

# starting jenkins
sudo systemctl start jenkins