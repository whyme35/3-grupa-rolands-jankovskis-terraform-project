module "dev-vpc"{
    source = "../../../modules/vpc"
    region=var.region
    vpc_cidr=var.vpc-cidr
    name=var.name
    environment=var.env
    public_subnets_cidr  = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    availability_zones   = var.availability_zones
}
module "dev-ec2"{
    source = "../../../modules/ec2"
    region=var.region
    name="${var.env}-3-grupa-rolands-jankovskis-terraform-host"
    environment=var.env
    instance_type = var.instance_type
    vpcid = module.dev-vpc.vpc_id
    subnet_id = module.dev-vpc.public_subnets_id[0]
    vpc_security_group_idsc = module.dev-vpc.security_groups_ids
    additional_tags = {
        Name="${var.env}-3-grupa-rolands-jankovskis-terraform-host"
    }
}