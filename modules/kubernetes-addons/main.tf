module "argocd" {
  count         = var.enable_argocd ? 1 : 0
  source        = "./argocd"
  helm_config   = var.argocd_helm_config
  applications  = var.argocd_applications
  addon_config  = { for k, v in local.argocd_addon_config : k => v if v != null }
  addon_context = local.addon_context
}

module "argo_rollouts" {
  count             = var.enable_argo_rollouts ? 1 : 0
  source            = "./argo-rollouts"
  helm_config       = var.argo_rollouts_helm_config
  manage_via_gitops = var.argocd_manage_add_ons
  addon_context     = local.addon_context
}

module "argo_workflows" {
  count             = var.enable_argo_workflows ? 1 : 0
  source            = "./argo-workflows"
  helm_config       = var.argo_workflows_helm_config
  manage_via_gitops = var.argocd_manage_add_ons
  addon_context     = local.addon_context
}
