resource "aws_subnet" "private_zone1" {
  cidr_block = "13.0.0.0/19"
  vpc_id = aws_vpc.main.id
  availability_zone = local.zone1

  tags = {
    Name = "${local.env}-private-${local.zone1}"
    "kubernetes.io/role/internal/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "private_zone2" {
  cidr_block = "13.0.32.0/19"
  vpc_id = aws_vpc.main.id
  availability_zone = local.zone2

  tags = {
    Name = "${local.env}-private-${local.zone2}"
    "kubernetes.io/role/internal/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone1" {
  cidr_block = "13.0.64.0/19"
  vpc_id = aws_vpc.main.id
  availability_zone = local.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.env}-public-${local.zone1}"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone2" {
  cidr_block = "13.0.96.0/19"
  vpc_id = aws_vpc.main.id
  availability_zone = local.zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.env}-public-${local.zone2}"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}
