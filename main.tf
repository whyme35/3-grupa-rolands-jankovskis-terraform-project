module "prod-vpc"{
    source = "./modules/vpc"
    region="us-west-1"
    vpc_cidr="192.168.0.0/16"
    name="vpc"
    environment="vpc"
    public_subnets_cidr  = ["192.168.1.0/24", "192.168.2.0/24"]
    private_subnets_cidr = ["192.168.3.0/24", "192.168.4.0/24"]
    availability_zones   = ["us-west-1a", "us-west-1c"]
}
module "prod-ec2"{
    source = "./modules/ec2"
    region="us-west-1"
    name="RJ_TEST_HOST"
    environment = "prod"
    instance_type = "t3.micro"
    vpcid = module.prod-vpc.vpc_id
    # vpc_security_group_idsc = module.prod-vpc.security_groups_ids
    subnet_id = module.prod-vpc.public_subnets_id[0]
    private_subnet_id = module.prod-vpc.private_subnets_id[0]
    vpc_security_group_idsc = module.prod-vpc.security_groups_ids
    additional_tags = {
        Name="3-grupa-rolands-jankovskis-terraform-host"
    }
}