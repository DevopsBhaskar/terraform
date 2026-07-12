data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

data "aws_instance" "mongodb" {
    instance_id = "i-04d9eb33284f260c3"
}

output "mongodb_info" {
    value = data.aws_instance.mongodb.public_ip
}

# Changes to Outputs:
#   + ami_id       = "ami-0220d79f3f480ecf5"
#   + mongodb_info = "54.221.136.197"
