# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "access_key"
  secret_key = "secret_key"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"


}
