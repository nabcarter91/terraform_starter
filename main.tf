provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "server1" {
  ami = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  user_data = <<EOF
                #!bin/bash
                echo "hello carter wolrd" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
  tags = {
Name = "server1"
}
}