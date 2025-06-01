variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

variable "key_name" {
  description = "Your EC2 key pair name"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2
}
