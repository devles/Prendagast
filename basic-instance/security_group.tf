resource "aws_security_group" "application_sg" {
  description = "Security Group for the Application Server"
  name = "Application_SG"
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["217.41.56.138/32"]
  }
  tags {
    Name = "Application_SG"
  }
}
