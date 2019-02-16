terraform {
  backend "s3" {
    bucket         = "{{ cookiecutter.terraform_backend_s3_bucket_name }}"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform_{{ cookiecutter.project_slug }}"
  }
}
