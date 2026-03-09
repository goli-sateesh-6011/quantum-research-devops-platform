provider "aws" {
    region = var.aws_region
}

terraform {
    required_version = ">= 1.3"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }

        tls = {
            source = "hashicorp/tls"
            version = "~> 4.0"
        }

        local = {
            source = "hashicorp/local"
            version = "~> 2.0"
        }
    }
}

resource "tls_private_key" "k8s_key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "k8s_key" {
    key_name = "terraform-k8s-key"
    public_key = tls_private_key.k8s_key.public_key_openssh
}

resource "local_file" "private_key" {
    content = tls_private_key.k8s_key.private_key_pem
    filename = "terraform-k8s-key.pem"
}