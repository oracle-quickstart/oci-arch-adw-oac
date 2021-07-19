output "generated_private_key_pem" {
  value = var.generate_public_ssh_key ? tls_private_key.compute_ssh_key.private_key_pem : "No Keys Auto Generated"
}