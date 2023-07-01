resource "aws_instance" "ec2_instance" {
  ami           = "ami-01d024789b7899a80"
  instance_type = "t2.micro"

  tags = {
    Name = "Reddit-blog"
  }
}