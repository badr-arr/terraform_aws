data "external" "script" {
  program = ["bash", "./scripts/get_ip.sh"]
}

resource "aws_security_group" "ubuntu" {
  name        = "ubuntu-sg"
  description = "Allow SSH only for my IP address"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.external.script.result.ip}/32"]
  }
}
