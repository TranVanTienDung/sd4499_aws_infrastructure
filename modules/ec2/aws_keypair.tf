// Keypair for logging in to our instance
resource "tls_private_key" "PracticalDevOpsSD4499_keypair" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "PracticalDevOpsSD4499_keypair"
  public_key = tls_private_key.PracticalDevOpsSD4499_keypair.public_key_openssh
  depends_on = [
    tls_private_key.PracticalDevOpsSD4499_keypair
  ]
}

resource "local_file" "key" {
  content         = tls_private_key.PracticalDevOpsSD4499_keypair.private_key_pem
  filename        = "PracticalDevOpsSD4499_keypair.pem"
  file_permission = "0400"
  depends_on = [
    tls_private_key.PracticalDevOpsSD4499_keypair
  ]
}