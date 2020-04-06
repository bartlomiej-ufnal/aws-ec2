#!/bin/bash

#default ec2 user set up   
ssh_user="ec2-user"

echo "List of ec2 instances and ssh files used to access them" 
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, Tags[0].Value ,State.Name, InstanceId,KeyName,PublicDnsName]' --output text

#Variables to config scp line for more comfortable usage you can autocomplete
read -e -p "Please enter path to ssh key file: " path_to_key_file 
read -e -p "Please enter path to file which you would like to copy: " file_to_copy
read -e -p "Please enter Public DNS of EC2 host: " ec2_host
read -e -p "Please enter path where to copy file in the ec2 instance: " where_to_put_file

scp -i $path_to_key_file $file_to_copy $ssh_user@$ec2_host:$where_to_put_file


