Terraform AWS Instance Deployment
This Terraform configuration deploys three AWS EC2 instances: a live server, a Jenkins server, and an Ansible server. Each instance is launched with the Amazon Linux AMI and the specified instance type. 
The configuration also includes user data scripts to perform additional setup on the Jenkins and Ansible servers.

Prerequisites
Before running this Terraform configuration, make sure you have the following prerequisites:

- Terraform installed on your machine.
- An AWS account with appropriate permissions to create EC2 instances and associated resources.
- AWS CLI configured with access and secret keys or IAM instance profile configured on the machine running Terraform.

Configuration
- Update the AWS provider region (if desired):
- In the provider "aws" block, modify the region parameter to your desired AWS region. The default is set to us-east-1.

- AMI ID: Replace the ami attribute in each aws_instance resource block with the appropriate Amazon Linux AMI ID for your desired region. 
The current value (ami-06b09bfacae1453cb) represents an example AMI ID.

- SSH Key Name: Update the key_name attribute in each aws_instance resource block with the name of your SSH key pair. The current value (mytest) represents an example key name.

- User Data (Jenkins Server): The jenkins_server resource block includes a user_data script that installs and configures Jenkins on the server. If you have custom requirements or want to modify the script, 
update the script accordingly. The script in the configuration enables Jenkins and starts the service after installation.

- User Data (Ansible Server): The ansible_server resource block includes a user_data script that installs Ansible on the server. Similar to the Jenkins server, if you have custom requirements or 
want to modify the script, update it as needed. The script in the configuration also adds Ansible binary path to the system path.

Deployment
Follow these steps to deploy the AWS instances using Terraform:

Initialize Terraform:
Run the following command to initialize Terraform in the directory containing the configuration files:
terraform init

Review the execution plan:
Run the following command to see a summary of the changes that will be applied:
terraform plan

Review the plan to ensure it aligns with your expectations.

Deploy the infrastructure:
Apply the Terraform configuration by running the following command:
terraform apply

Terraform will prompt for confirmation before proceeding. Enter yes to proceed with the deployment.

Monitor the progress:
Terraform will start provisioning the AWS instances. You can monitor the progress in the command output.

Access the instances:
After the deployment is complete, you can access the instances using SSH or any other preferred method.

Clean up:
When you no longer need the deployed infrastructure, you can destroy it using Terraform. Run the following command:
terraform destroy

Terraform will prompt for confirmation before destroying the infrastructure. Enter yes to proceed with the destruction.

Conclusion
This Terraform configuration allows you to easily deploy AWS EC2 instances for a live server, Jenkins server, and Ansible server. By following the provided instructions, 
you can customize the configuration to meet your specific requirements and deploy the infrastructure in your desired AWS region.