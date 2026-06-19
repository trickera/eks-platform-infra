TF_DIR := terraform
BOOTSTRAP_DIR := bootstrap

.PHONY: fmt lint sec validate bootstrap init plan apply destroy

fmt:
	terraform fmt -recursive

lint:
	tflint --init
	tflint --recursive -f compact

sec:
	trivy config --tf-exclude-downloaded-modules .

validate:
	terraform -chdir=$(TF_DIR) init -backend=false
	terraform -chdir=$(TF_DIR) validate

bootstrap:
	terraform -chdir=$(BOOTSTRAP_DIR) init
	terraform -chdir=$(BOOTSTRAP_DIR) apply

init:
	terraform -chdir=$(TF_DIR) init

plan:
	terraform -chdir=$(TF_DIR) plan

apply:
	terraform -chdir=$(TF_DIR) apply

destroy:
	terraform -chdir=$(TF_DIR) destroy
