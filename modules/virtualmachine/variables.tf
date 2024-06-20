variable instance_size {
    type = string
    description = "ec2 web server size"
    default = "t2.micro"
}

variable instance_ami {
    type = string
    description = "ec2 ami type"
    default = "ami-079db87dc4c10ac91"
}

variable subnet_id {
    type = string
    description = "vpc id"
    default = "subnet-05a0e4240292ea43e"
}

variable security_id {
    type = list
    description = "security id"
    default = ["sg-0690b79701e9bc81f"]
}

variable infra_env {
    type = string
    description = "machine name"
    default = "machine"
}

variable mykey_name {
    type = string
    description = "key name"
    default = "ssh-pair"
}

