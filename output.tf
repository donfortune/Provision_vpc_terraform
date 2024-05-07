provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "fortune_vpc" {
    cidr_block = ""
}

resource "aws_subnet" "fortune_subnet" {
        vpc_id = aws_vpc.fortune_vpc.id
        cidr_block = ""
}

resource "aws_route_table" "fortune_route_table" {
        vpc_id = aws_vpc.fortune_vpc.id
}

resource "aws_internet_gateway" "fortune_igw" {
        vpc_id = aws_vpc.fortune_vpc.id
}

resource "aws_network_acl" "fortune_acl" {
        vpc_id = aws_vpc.fortune_vpc.id
}

resource "aws_security_group" "fortune_sg" {
        vpc_id = aws_vpc.fortune_vpc.id
}

