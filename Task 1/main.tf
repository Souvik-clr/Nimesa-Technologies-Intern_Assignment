provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

# Task 1: Create VPC with one private subnet and one public subnet

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Adjust CIDR block as needed
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"  # Adjust CIDR block as needed
  availability_zone = "us-east-1a"  # Adjust AZ as needed
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"  # Adjust CIDR block as needed
  availability_zone = "us-east-1a"  # Adjust AZ as needed
  tags = {
    Name = "PrivateSubnet"
  }
}

# Task 2: Create an EC2 instance

resource "aws_instance" "purpose" {
  ami           = "ami-053b0d53c279acc90"  # Change to your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }

  tags = {
    Name    = "purpose"
    purpose = "Assignment"
  }
}

# Task 3: Create security group and attach it to the EC2 instance

resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.my_security_group.id
  network_interface_id = aws_instance.purpose.primary_network_interface_id
}

