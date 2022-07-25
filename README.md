terraform init -upgrade

terraform plan -var="access_token=$ACCESS_TOKEN" -var="realm=$REALM" -var="sfx_prefix=[$(hostname)]"

terraform apply -var="access_token=$ACCESS_TOKEN" -var="realm=$REALM" -var="sfx_prefix=[$(hostname)]"

terraform destroy -var="access_token=$ACCESS_TOKEN" -var="realm=$REALM"

NOTE: Create file variables.auto.tfvars in the root directory of the project and add values for realm and access_token