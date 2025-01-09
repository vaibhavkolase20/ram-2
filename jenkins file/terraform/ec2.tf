resource "aws_instance" "myserver" {
  ami             = "ami-0e2c8caa4b6378d8c"
  key_name        = "vaibhav"
  instance_type   = "t2.micro"
  vpc_security_group_ids = ["sg-0a7c002efafb49d30"]
  availability_zone = "us-east-1b"

  tags = {
    Name = "ram"
    Env  = "krushna"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main' | sudo tee /etc/apt/sources.list.d/hashicorp.list"
    ]
  }
}
