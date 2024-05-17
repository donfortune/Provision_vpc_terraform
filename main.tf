provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "fortune_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc"
    }
}

resource "aws_subnet" "fortune_subnet" {
    vpc_id = aws_vpc.fortune_vpc.id
    cidr_block = "10.0.1.0/24"  
    availability_zone = "us-east-1a"
    tags = {
        Name = "my_subnet"
    }
}

resource "aws_internet_gateway" "fortune_igw" {
    vpc_id = aws_vpc.fortune_vpc.id

    tags = {
        Name = "my_igw"
    }
}

resource "aws_route_table" "fortune_route_table" {
    vpc_id = aws_vpc.fortune_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.fortune_igw.id
    }
}

resource "aws_route_table_association" "my_route_association" {
    subnet_id      = aws_subnet.fortune_subnet.id
    route_table_id = aws_route_table.fortune_route_table.id
}
