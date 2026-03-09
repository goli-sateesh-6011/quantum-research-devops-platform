resource "aws_vpc" "k8s_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "quantum-vpc"
    }
}

resource "aws_subnet" "k8s_subnet" {
    vpc_id            = aws_vpc.k8s_vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "eu-west-3a"
    map_public_ip_on_launch = true

    tags = {
        Name = "quantum-subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.k8s_vpc.id
}

resource "aws_route_table" "k8s_route_table" {
    vpc_id = aws_vpc.k8s_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "quantum-route-table"
    }
}

resource "aws_route_table_association" "k8s_rt" {
    subnet_id       = aws_subnet.k8s_subnet.id
    route_table_id  = aws_route_table.k8s_route_table.id
}