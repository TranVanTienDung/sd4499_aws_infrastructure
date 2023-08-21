output "backend_repo_url" {
  value = aws_ecr_repository.PracticalDevOpsSD4499_ECR_Repo_Backend.repository_url
}

output "frontend_repo_url" {
  value = aws_ecr_repository.PracticalDevOpsSD4499_ECR_Repo_Frontend.repository_url
}