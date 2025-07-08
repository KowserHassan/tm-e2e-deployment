output "cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.app_ecs.name
}

output "cluster_id" {
  description = "ECS cluster ID"
  value       = aws_ecs_cluster.app_ecs.id
}

output "cluster_arn" {
  description = "ECS cluster ARN"
  value       = aws_ecs_cluster.app_ecs.arn
}

output "service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.app_service.name
}

output "service_id" {
  description = "ECS service ID"
  value       = aws_ecs_service.app_service.id
}

output "task_definition_arn" {
  description = "Task definition ARN"
  value       = aws_ecs_task_definition.app_task.arn
}

