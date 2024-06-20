module "virtualmachine" {
  source = "../../../modules/virtualmachine"
  instance_size   = var.myinstance_size
  instance_ami = var.myinstance_ami
  mykey_name      = "ssh-pair"
  subnet_id        = var.subnet_id
  security_id     = var.security_id
  infra_env     = "machine" 

}

module "loadbalancer"{
  source = "../../../modules/loadbalancer"
  web_instance_ids = module.virtualmachine.web_instance_ids
  depends_on = [module.virtualmachine]
}
