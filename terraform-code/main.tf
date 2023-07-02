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
  key_name      = "mytest"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y java-11-amazon-corretto
    sudo yum install -y java-11-amazon-corretto-devel
    sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

    # Disable GPG check for Jenkins package installation
    sudo sed -i 's/gpgcheck=1/gpgcheck=0/' /etc/yum.repos.d/jenkins.repo
    
    sudo yum install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
  EOF
  
  tags = {
    Name = "Jenkins Server"
  }
}



resource "aws_instance" "ansible_server" {
  ami           = "ami-06b09bfacae1453cb"  # Replace with the appropriate Amazon Linux AMI ID
  instance_type = "t2.micro"
  key_name      = "mytest"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y

    # Delay for 30 seconds
    sleep 30

    sudo yum install -y python3-pip

    # Delay for 60 seconds to allow package installation to complete
    sleep 60

    # Install Ansible using pip
    sudo python3 -m pip install ansible

    # Delay for 60 seconds to allow package installation to complete
    sleep 90

    # Add Ansible binary path to the system path
    echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc

    # Source the updated bashrc file
    source ~/.bashrc

    # Additional delay after adding the path
    sleep 150
  EOF

  tags = {
    Name = "Ansible server"
  }
}