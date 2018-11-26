resource "aws_s3_bucket" "terraform" {
  // TODO Add a prefix to the bucket name (e.g. com.example.myproject.terraform). This should also be in terraform.tf.
  bucket = "<prefix>.{{ cookiecutter.project_slug }}.terraform"

  tags {
    Name = "{{ cookiecutter.project_slug }} Terraform State Store"
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
