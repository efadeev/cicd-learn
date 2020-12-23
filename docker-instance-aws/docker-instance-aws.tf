provider "aws" { }

resource "aws_instance" "my_docker" {
  ami                    = "ami-0502e817a62226e03"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_docker.id]
  user_data              = file("docker-install.sh")
  #key_name              = "keypair"
}

resource "aws_security_group" "my_docker" {
  name        = "docker_sec_group"
  description = "Docker Server Security Group"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
