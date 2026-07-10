resource "aws_instance" "terraform" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids = [aws_security_group.terrall.id]
    tags = {
        Name = "terraform-1"
        Terraform = "true" # saying that creating instance using terraform
    }
}

resource "aws_security_group" "terrall" {
  name   = "terraform-all"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "ter-all"
  }

}