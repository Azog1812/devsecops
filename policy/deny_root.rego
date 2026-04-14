package main

# Deny Kubernetes Deployments where any container runs as root (UID 0)
deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    container.securityContext.runAsUser == 0
    msg := sprintf(
        "VIOLATION: Container '%s' in Deployment '%s' is configured to run as root (UID 0). Running containers as root is a critical security risk.",
        [container.name, input.metadata.name]
    )
}

# Deny Deployments where containers have no securityContext defined
deny[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    not container.securityContext
    msg := sprintf(
        "VIOLATION: Container '%s' in Deployment '%s' has no securityContext defined. A securityContext with a non-root user is required.",
        [container.name, input.metadata.name]
    )
}

# Warn when privileged mode is enabled
warn[msg] {
    input.kind == "Deployment"
    container := input.spec.template.spec.containers[_]
    container.securityContext.privileged == true
    msg := sprintf(
        "WARNING: Container '%s' in Deployment '%s' is running in privileged mode.",
        [container.name, input.metadata.name]
    )
}
