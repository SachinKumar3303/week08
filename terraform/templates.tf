resource "local_sensitive_file" "application_secret" {
  content = templatefile("${path.module}/templates/07-application-secret.yaml.tftpl", {
    storage_connection_string = azurerm_storage_account.storage_account.primary_connection_string
  })

  filename = "${path.module}/../kubernetes/07-application-secret-generated.yaml"
}

resource "local_file" "user_service" {
  content = templatefile("${path.module}/templates/08-user-service.yaml.tftpl", {
    acr_login_server = azurerm_container_registry.acr.login_server
  })

  filename = "${path.module}/../kubernetes/08-user-service-generated.yaml"
}

resource "local_file" "student_service" {
  content = templatefile("${path.module}/templates/09-student-service.yaml.tftpl", {
    acr_login_server          = azurerm_container_registry.acr.login_server
    student_profile_container = azurerm_storage_container.student_profile_photo.name
  })

  filename = "${path.module}/../kubernetes/09-student-service-generated.yaml"
}

resource "local_file" "lecturer_service" {
  content = templatefile("${path.module}/templates/10-lecturer-service.yaml.tftpl", {
    acr_login_server           = azurerm_container_registry.acr.login_server
    lecturer_profile_container = azurerm_storage_container.lecturer_profile_photo.name
  })

  filename = "${path.module}/../kubernetes/10-lecturer-service-generated.yaml"
}

resource "local_file" "course_service" {
  content = templatefile("${path.module}/templates/11-course-service.yaml.tftpl", {
    acr_login_server = azurerm_container_registry.acr.login_server
  })

  filename = "${path.module}/../kubernetes/11-course-service-generated.yaml"
}

resource "local_file" "enrollment_service" {
  content = templatefile("${path.module}/templates/12-enrollment-service.yaml.tftpl", {
    acr_login_server = azurerm_container_registry.acr.login_server
  })

  filename = "${path.module}/../kubernetes/12-enrollment-service-generated.yaml"
}

resource "local_file" "frontend" {
  content = templatefile("${path.module}/templates/13-frontend.yaml.tftpl", {
    acr_login_server = azurerm_container_registry.acr.login_server
  })

  filename = "${path.module}/../kubernetes/13-frontend-generated.yaml"
}