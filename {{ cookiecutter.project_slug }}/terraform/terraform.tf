terraform {
  backend "s3" {
    // TODO Add a prefix to the bucket name (e.g. com.example.myproject.terraform). Update backend_setup/main.tf, too!
    bucket         = "<prefix>.{{ cookiecutter.project_slug }}.terraform"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform_{{ cookiecutter.project_slug }}"
  }
}
