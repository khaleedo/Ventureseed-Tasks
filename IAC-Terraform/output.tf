output "ecr_repo_url" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.ai_model_repo.repository_url
}

output "ecs_cluster_name" {
  description = "ECS Cluster Name"
  value       = aws_ecs_cluster.ai_inference_cluster.name
}