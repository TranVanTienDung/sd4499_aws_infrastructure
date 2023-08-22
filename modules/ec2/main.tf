module "ec2_instance_tags" {
  source = "../tags"

  name        = var.name
  project     = var.project
  environment = var.environment
  owner       = var.owner

  tags = {
    Description = "Managed by terraform",
  }
}

resource "aws_instance" "PracticalDevOpsSD4499_ec2" {
  ami                     = "ami-0ccabb5f82d4c9af5"
  instance_type           = "t3a.large"
  key_name                = aws_key_pair.generated_key.key_name
  vpc_security_group_ids  = ["${aws_security_group.PracticalDevOpsSD4499_security_group.id}"]
  subnet_id               = aws_subnet.PracticalDevOpsSD4499_public_subnet.id
  iam_instance_profile    = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    yum upgrade
    amazon-linux-extras install java-openjdk11 -y
    dnf install java-11-amazon-corretto -y
    yum install jenkins -y
    systemctl enable jenkins
    systemctl start jenkins
    sudo yum update -y
    sudo yum -y install docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo chmod 666 /var/run/docker.sock
    sudo usermod -a -G docker jenkins
    yum install git -y
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    EOF

  tags = module.ec2_instance_tags.tags
}
