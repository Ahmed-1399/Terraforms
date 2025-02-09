# Steps to Create EC2

## 1. Create provider.tf file
```bash
# Which containes the provider information
```
## 2. Initialize the directory
```bash
# Make sure you are in the directory that contains the tf files then do the follosing:
terraform init
```

## 3. Create main.tf file
```bash
# That containes the resources that you will build ex: EC2 instence specs
```

## 4. Create security.tf file
```bash
# That containes the security group attached to the ec2 instence 
# Also the key_pair that will be used to connect on the ec2 instence
```

## 5. Create variables.tf file
```bash
# That containes all the variables with the data that you should not expose to public

# Make sure you generate SSH key if you don't have one and added into the variables.tf file
ssh-keygen 
```

## 6. Create outputs.tf file
```bash
# That containes all the variables taht you want to display on the terminal
```

## 7. Create terraform.tfvars file 
```bash
# That contains the variables that you will not share it on the version control
# Add your public ssh key to the terraform.tfvars
# Remember to add it to .gitignore file
```

## 8. Check what will be created if you apply 
```bash
# This command is to check and show if there is an error before applying it
terraform validate

terraform plan
```

## 9. Apply the infrastruction 
```bash
# This command is start building the infrastructure on the cloud  
terraform apply # It will first show your the plan then you have to type yes to build
# OR 
terraform apply -auto-approve # To plan and apply changes without confirming
```

## 10. Import Changes from the Cloud to .tfstate file
```bash
# to pull changes from changes
terraform refresh

# You can try another way too
 - list all resources in .tfstate file 
     terraform state list
 - remove resource
     terraform state rm resource_name
 - Import resource
                        [Option 1]                 [Option 2]
     terraform import resource_type.resource_name resource_id

  - Focs on this step
       some resources doesn't import by this way so return to the Documentation to see the correct way

```
## 11. Connect to the created EC2 instence
```bash
# Make sure you are in the directory where the keypair was downloaded
 - firstly change permission of private_key
     chmod 400 file.pem
 - connect on the EC2
     ssh -i "file.pem" <user@ec2...>
```

## 12. Destroy created resources
```bash
# This command will show you first what it will destroy then ask you to type yes to confirm
terraform destroy
# OR
terraform destroy -auto-approve # To immediately destroy all the created resources without confirming
# OR
terraform destroy -auto-approve -refresh=false # To skip refresh on resources
