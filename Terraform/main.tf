provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "jenkins" {
  ami = "ami-0667149a69bc2c367" // centos 7 machine ami
  instance_type = "t2.micro"
  key_name = "jenkins"
  security_groups = [aws_security_group.jenkins_sg.name]
  tags = {
    Name = "Jenkins & Docker"
  }
}


resource "aws_security_group" "jenkins_sg" {
  name = "jenkins_sg"

  // opening port 8080 to access jenkins server
  ingress {
    from_port = 8080
    protocol  = "TCP"
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]

  }

    // opening port 3000 to access Application
  ingress {
    from_port = 8080
    protocol  = "TCP"
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]

  }

  // opening port 22 to get inside the OS with SSH
  ingress {
    from_port = 22
    to_port   = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}