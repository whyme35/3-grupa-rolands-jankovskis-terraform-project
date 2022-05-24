    region="us-west-1"
    vpc-cidr="192.168.0.0/16"
    name="prod"
    env="prod"
    public_subnets_cidr  = ["192.168.1.0/24", "192.168.2.0/24"]
    private_subnets_cidr = ["192.168.3.0/24", "192.168.4.0/24"]
    availability_zones   = ["us-west-1a", "us-west-1c"]
    instance_type = "t3.micro"
