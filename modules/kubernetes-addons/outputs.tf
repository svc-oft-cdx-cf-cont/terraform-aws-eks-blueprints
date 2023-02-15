output "argocd" {
  description = "Map of attributes of the Helm release and IRSA created"
  value       = try(module.argocd[0], null)
}

output "argo_rollouts" {
  description = "Map of attributes of the Helm release and IRSA created"
  value       = try(module.argo_rollouts[0], null)
}

output "argo_workflows" {
  description = "Map of attributes of the Helm release and IRSA created"
  value       = try(module.argo_workflows[0], null)
}
