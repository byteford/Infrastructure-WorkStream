output "ECR_repo_url" {
  value = module.ECR.repo_url
}
output "DNSName" {
  value = module.Network.loadbalancer.dns_name
}