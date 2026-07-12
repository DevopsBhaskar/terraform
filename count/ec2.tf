resource "aws_instance" "terraform" {
    count = 4
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.terrall.id]
    tags = {
        Name = var.instances[count.index]
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