#!/bin/bash
#
#
# Author : Suresh
# Date : 170825
# Version: V1
#
#
#########################

# Script to Check AWS Resources 

# Check aws cli installed 

if [ $# -ne 2 ]; then 

	echo "Usage: ./aws_resources_list.sh <Service-region> <serviece-name>"
	echo "Example: ./aws_resources_list.sh <us-east-1> ec2"
	exit 1
fi

#pass Arguements
aws_region=$1
aws_service=$2

#check AWs CLi installed

if ! command -v aws &> /dev/null ; then
	echo "Please insall aws CLI"
	exit 1

fi


#check AWS Configured

if [ ! -d ~/.aws ]; then
	echo"AWs not configured , Please configure"
	exit 1

fi


#Resouces going to check are Ec2 , S3 , IAM 


case $aws_service in
	ec2)
		echo " List Ec2 Instances in $aws_region "
		aws ec2 describe-instances --region $aws_region
		;;
	s3)
		echo" List all Buckets in $aws_region"
		aws s3api list-buckets --region $aws_region
		;;

	iam)
		echo "All Iam Users in $aws_region"
		aws iam list-users --region $aws_region
		;;
esac



