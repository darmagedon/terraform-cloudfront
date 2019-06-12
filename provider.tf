provider "aws" {
    shared_credentials_file = "$HOME/.aws/credentials"
    profile = "${var.aws_configuration["profile"]}"
    region = "${var.aws_configuration["region"]}"
}