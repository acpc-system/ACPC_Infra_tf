#region
variable "region"{
type= string
}

#access key and secret key 
variable "aws_access_key" {
type= string
}

variable "aws_secret_key"{
type= string
}

## vpc cidr 
variable "vpc_cidr"{
type= string 
default= "10.0.0.0/16"
}
# subnets
variable "pubsub1cidr" {
type= string
default= "10.0.1.0/24"
}

variable "pubsub2cidr" {
type= string
default= "10.0.2.0/24"
}

variable "privsub1cidr" {
type= string
default= "10.0.3.0/24"
}

variable "privsub2cidr" {
type= string
default= "10.0.4.0/24"
}


