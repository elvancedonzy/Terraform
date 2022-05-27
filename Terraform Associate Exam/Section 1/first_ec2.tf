# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWY3YK63M4LAQX65E"
  secret_key = "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"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"


}
