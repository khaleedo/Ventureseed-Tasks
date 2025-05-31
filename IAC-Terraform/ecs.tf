resource "aws_ecs_cluster" "ai_inference_cluster" {
  name = "ai-inference-cluster"
}

resource "aws_ecs_task_definition" "ai_task" {
  family                   = "ai-task-def"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name      = "ai-model-container",
      image     = "${aws_ecr_repository.ai_model_repo.repository_url}:latest",
      essential = true,
      portMappings = [{
        containerPort = 5000,
        protocol      = "tcp"
      }]
    }
  ])
}

resource "aws_ecs_service" "ai_service" {
  name            = "ai-inference-service"
  cluster         = aws_ecs_cluster.ai_inference_cluster.id
  task_definition = aws_ecs_task_definition.ai_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = module.vpc.public_subnets
    security_groups  = [aws_security_group.allow_http.id]
    assign_public_ip = true
  }
  depends_on = [aws_ecs_task_definition.ai_task]
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}