provider "aws" {
  access_key = "AKIAJZLWEZ6SZWMN5MJA"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "appserver" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  key_name	= "Oscar"
  subnet_id = "subnet-ec0262e0"
    security_groups = [
        "${aws_security_group.application_sg.id}",
    ]
  tags {
    Name = "AppServer"
    Description = "Application server"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.appserver.public_ip} > ip_address.txt"
  }
}
