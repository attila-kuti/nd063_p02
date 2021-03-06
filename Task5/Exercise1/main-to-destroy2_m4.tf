# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  profile = "attila.kuti1"
  region = "us-east-1"
}


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2


resource "aws_instance" "UdacityT2" {
  count = "4"
  ami = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"

  tags = {
    Name = "UdacityP02"
  }
}



# TODO: provision 2 m4.large EC2 instances named Udacity M4

resource "aws_instance" "UdacityM4" {
  count = "0"
  ami = "ami-0947d2ba12ee1ff75"
  instance_type = "m4.large"
  tags = {
    Name = "UdacityP02"
  }
}
