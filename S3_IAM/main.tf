# Root Module
module "s3" {
    # refere to 'Dir' Only
    source = "./modules/s3"
}

module "iam" {
    source = "./modules/iam"
}