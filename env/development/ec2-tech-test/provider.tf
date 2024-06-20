provider "aws" {
   region = "us-east-1"
   profile                 = "aws-root"
   shared_credentials_files = ["C:/Users/User/.aws/credentials"]

 }

 terraform {
  required_version = ">= 0.12"
}