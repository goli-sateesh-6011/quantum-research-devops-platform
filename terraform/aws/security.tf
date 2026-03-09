resource "aws_security_group" "k8s_sg" {
    name    = "k8s-aws_security_group"
    vpc_id  = aws_vpc.k8s_vpc.id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Kubernetes API"
        from_port   = 6443
        to_port     = 6443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Node Communication"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        self        = true
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks  = ["0.0.0.0/0"] 
    }
}
