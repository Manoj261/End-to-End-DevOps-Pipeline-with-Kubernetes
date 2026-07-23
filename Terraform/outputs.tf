output "k8_master_public_ip" {
  description = "Public IP of Kubernetes Master"
  value       = aws_instance.K8-M.public_ip
}

output "k8_master_private_ip" {
  description = "Private IP of Kubernetes Master"
  value       = aws_instance.K8-M.private_ip
}

output "k8_worker1_public_ip" {
  description = "Public IP of Kubernetes Worker 1"
  value       = aws_instance.K8-S1.public_ip
}

output "k8_worker1_private_ip" {
  description = "Private IP of Kubernetes Worker 1"
  value       = aws_instance.K8-S1.private_ip
}
output "k8_worker2_public_ip" {
  description = "Public IP of Kubernetes Worker 2"
  value       = aws_instance.K8-S2.public_ip
}

output "k8_worker2_private_ip" {
  description = "Private IP of Kubernetes Worker 2"
  value       = aws_instance.K8-S2.private_ip
}