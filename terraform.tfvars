region             = "us-east-1"
vpc_cidr           = "192.168.0.0/16"
vpc_name           = "Terraformb1"
publicsubnet_cidr  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
privatesubnet_cidr = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
az                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
ami                = "ami-0cd59ecaf368e5ccf"
key              = "AWS_Default"                   