provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_instance" "live_server" {
  ami           = "ami-06b09bfacae1453cb"  # Replace with the appropriate Amazon Linux AMI ID
  instance_type = "t2.micro"
  key_name = "mytest"

  tags = {
    Name = "Live server"
  }
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-06b09bfacae1453cb"  # Replace with the appropriate Amazon Linux AMI ID
  instance_type = "t2.micro"
  key_name = "mytest"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y java-1.8.0-openjdk-devel
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    EOF

  tags = {
    Name = "Jenkins server"
  }
}

resource "aws_instance" "ansible_server" {
  ami           = "ami-06b09bfacae1453cb"  # Replace with the appropriate Amazon Linux AMI ID
  instance_type = "t2.micro"
  key_name = "mytest"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install -y ansible2
    EOF

  tags = {
    Name = "Ansible server"
  }
}
