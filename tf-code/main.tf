resource "aws_instance" "web" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0665a56c7cd09a0e0"]
  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type = "persistent"
    }
  }
  tags = {
    Name = "docker-images"
  }
}
