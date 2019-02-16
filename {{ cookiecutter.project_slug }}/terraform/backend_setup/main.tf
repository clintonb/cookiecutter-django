resource "aws_s3_bucket" "terraform" {
  bucket = "{{ cookiecutter.terraform_backend_s3_bucket_name }}"

  tags {
    Name = "{{ cookiecutter.project_name }} Terraform State Store"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform" {
  name           = "terraform_{{ cookiecutter.project_slug }}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
