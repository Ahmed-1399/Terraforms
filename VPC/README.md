# Steps to Create VPC $ EC2

## 1. Create provider.tf file
```bash
# Which containes the provider information
```
## 2. Initialize the directory
```bash
# Make sure you are in the directory that contains the tf files then do the follosing:
terraform init
```

## 3. Create VPC.tf file
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
## 6. Create route_table.tf file
```bash
# That containes EIP, NAT, Route Table for Public and Private EC2 Instance
```

## 7. Create outputs.tf file
```bash
# That containes all the variables that you want to display on the terminal
```
## 8. Create IGW_egress.tf file
```bash
# That containes Internet Gateway{IGW-IPV4}, Egress Only Internet Gateway{egress-IPV6}
```
## 9. Create EC2_instance.tf file
```bash
# That containes 2 Instance
```
## 10. Check what will be created if you apply 
```bash
# This command is to check and show if there is an error before applying it
# Format Script, then Check Syntax if there is any errors.
terraform fmt

terraform validate

terraform plan
```

## 11. Apply the infrastruction 
```bash
# This command is start building the infrastructure on the cloud  
terraform apply # It will first show your the plan then you have to type yes to build
# OR 
terraform apply -auto-approve # To plan and apply changes without confirming
```

## 12. Connect to the created EC2 instence
```bash
# Make sure you are in the directory where the keypair was downloaded
 - firstly change permission of private_key
     chmod 400 file.pem
 - connect on the EC2
     ssh -i "Key.pem" <ec2-user@IP.>
```

## 13. Destroy created resources
```bash
# This command will show you first what it will destroy then ask you to type yes to confirm
terraform destroy
# OR
terraform destroy -auto-approve # To immediately destroy all the created resources without confirming
# OR
terraform destroy -auto-approve -refresh=false # To skip refresh on resources
