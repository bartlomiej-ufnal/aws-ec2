#!/bin/bash

declare -a ec2instances
ssh_user="ec2-user"

echo "List of ec2 instances" 
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[Placement.AvailabilityZone, Tags[0].Value ,State.Name, InstanceId,KeyName,PublicDnsName]' --output text

ec2_host=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PublicDnsName]' --output text)

for i in $ec2_host; do
	ec2instances+=($i)
done


#wordlist=$(echo "${ec2instances[*]}")

echo $ec2instaces


#COM=($(compgen -W "${ec2instances[*]}" "${COMP_CWORD[*]}"))

#reply=$(rlwrap -S 'Choose your instance ' -c)
# -i -f <(echo "${ec2instances[@]}") -o cat
#echo $reply

#ec2_host=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[PublicDnsName]' --output text)

#ec2instanceslist=($(compgen -W "${ec2instances[*]}"))

#echo $ec2instanceslist

#download key pem

#chmod 400 your-key.pem

read -e -p "Please enter path to ssh key file: " path_to_key_file 
read -e -p "Please enter path to file which you would like to copy: " file_to_copy
read -e -p "Please enter path where to copy file in the ec2 instance " where_to_put_file

echo scp -i $path_to_key_file $file_to_copy $ssh_user@$ec2_host:$where_to_put_file




