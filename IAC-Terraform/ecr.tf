resource "aws_ecr_repository" "ai_model_repo" {
  name = "ai-model-inference"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}