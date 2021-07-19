## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "null_resource" "Login2OCIR" {

  provisioner "local-exec" {
    command = "echo '${var.ocir_user_password}' |  docker login ${local.ocir_docker_repository} --username ${local.ocir_namespace}/${var.ocir_user_name} --password-stdin"
  }
}

resource "null_resource" "DecoderPush2OCIR" {
  depends_on = [null_resource.Login2OCIR,  
                oci_functions_application.DecoderApp]

  provisioner "local-exec" {
    command = "image=$(docker images | grep decoder | awk -F ' ' '{print $3}') ; docker rmi -f $image &> /dev/null ; echo $image"
    working_dir = "functions/decoder"
  }

  provisioner "local-exec" {
    command = "fn build --verbose"
    working_dir = "functions/decoder"
  }

  provisioner "local-exec" {
    command = "docker images"
    working_dir = "functions/decoder"
  }

  provisioner "local-exec" {
    command = "docker tag oci-sch-stream-json-to-csv-python:0.0.50 ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/decoder:latest"
    working_dir = "functions/decoder"
  }

  provisioner "local-exec" {
    command = "docker push ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/decoder:latest"
    working_dir = "functions/decoder"
  }

}

