variable "aws_region" {
    default = "eu-west-3"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "key_name" {
    description = "SSH key for EC2 instances"
    type        = string
}

variable "cluster_name" {
    default = "quantum-k8s-cluster"
}