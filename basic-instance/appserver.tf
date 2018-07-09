resource "aws_instance" "appserver" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
  key_name	= "Oscar2018"
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
