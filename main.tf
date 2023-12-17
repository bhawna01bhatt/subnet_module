resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "my_public_subnet" {
  count  = length(var.pub_subnet_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block        = element(var.pub_subnet_cidr , count.index)
  availability_zone = element(var.subnet_az ,count.index)
  tags = {
    Name = element(var.pub_subnet_name ,count.index)
  }
}
resource "aws_subnet" "my_private_subnet" {

  count  = length(var.pri_subnet_cidr)
  cidr_block = var.pri_subnet_cidr[count.index]
  vpc_id                  = aws_vpc.my_vpc.id

  availability_zone = element(var.subnet_az ,count.index)

  tags = {
    Name = element(var.pri_subnet_name ,count.index)
  }
}



