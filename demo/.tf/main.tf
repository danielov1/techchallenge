provider "aws" {
  region = var.region
  access_key = var.accessKey
  secret_key = var.secretKey
  token = var.sessionToken
}

resource "aws_vpc" "prod" {
  cidr_block = var.cidr_block

  tags = {
    Name = "Prod-${var.prefix}"
  }
}

resource "aws_internet_gateway" "challenge_igw" {
  vpc_id = aws_vpc.prod.id
}

resource "aws_route_table" "challenge_route_table" {
  vpc_id = aws_vpc.prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.challenge_igw.id
  }

  tags = {
    Name = "Prod"
  }
}

resource "aws_subnet" "challenge_subnet" {
  cidr_block = var.cidr_block
  vpc_id = aws_vpc.prod.id
  availability_zone = var.az

  tags = {
    Name = "Public-${var.prefix}"
  }
}

resource "aws_route_table_association" "challenge_rt_accociate" {
  route_table_id = aws_route_table.challenge_route_table.id
  subnet_id = aws_subnet.challenge_subnet.id
}

resource "aws_security_group" "challenge_sg_web_traffic" {
  name = "${var.prefix}-allow_web_traffic"
  description = "Allow Web traffic on port 80"
  vpc_id = aws_vpc.prod.id

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [var.publicIPaddr]
  }

  ingress {
    description = "HTTPS"
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [var.publicIPaddr]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [var.publicIPaddr]
  }

  tags = {
    Name = "allow_web_ssh"
  }
}

resource "aws_network_interface" "challenge_network_interface1" {
  subnet_id = aws_subnet.challenge_subnet.id
  private_ips = var.private_ip_s1
  security_groups = [aws_security_group.challenge_sg_web_traffic.id]
}
resource "aws_network_interface" "challenge_network_interface2" {
  subnet_id = aws_subnet.challenge_subnet.id
  private_ips = var.private_ip_s2
  security_groups = [aws_security_group.challenge_sg_web_traffic.id]
}

resource "aws_eip" "challenge_eip1" {
  depends_on = [aws_internet_gateway.challenge_igw, aws_instance.challenge_instance1]
  vpc = true
  network_interface = aws_network_interface.challenge_network_interface1.id
  associate_with_private_ip = var.private_ip_s1[0]
}

resource "aws_eip" "challenge_eip2" {
  depends_on = [aws_internet_gateway.challenge_igw, aws_instance.challenge_instance2]
  vpc = true
  network_interface = aws_network_interface.challenge_network_interface2.id
  associate_with_private_ip = var.private_ip_s2[0]
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.publicKey
}

resource "aws_instance" "challenge_instance1" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  availability_zone = var.az
  key_name = var.key_name
  user_data =  <<-EOF
              #!/bin/bash
              sudo -i
              sudo apt update -y
              sudo apt install apache2 -y
              sudo apt install net-tools -y
              sudo systemctl start apache2
              sudo echo '127.0.0.1 www.ascii-art.de' >> /etc/hosts
              sudo ip route add 208.86.224.90/32   dev eth0 src 10.0.1.50
              sudo rm /var/www/html/index.html
              sudo echo 'Hello world' > /var/www/html/index.html
              sudo echo '<Directory />' > /etc/apache2/conf-enabled/security.conf
              sudo echo '   Order Deny,Allow' >> /etc/apache2/conf-enabled/security.conf
              sudo echo '   Deny from all' >> /etc/apache2/conf-enabled/security.conf
              sudo echo '</Directory>' >> /etc/apache2/conf-enabled/security.conf
              sudo service  apache2 reload
              EOF 

  network_interface {
    device_index = 0 
    network_interface_id = aws_network_interface.challenge_network_interface1.id
  }

  tags = {
    Name = "server1"
  }
}

resource "aws_instance" "challenge_instance2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  availability_zone = var.az
  key_name = var.key_name


  network_interface {
    device_index = 0 
    network_interface_id = aws_network_interface.challenge_network_interface2.id
  }

  tags = {
    Name = "server2"
  }
}
