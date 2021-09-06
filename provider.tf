provider "aws" {
    access_key = "${vars.AWS_ACCESS_KEY}"
    secret_key = "${vars.AWS_SECRET_KEY}"
    region     = "${vars.AWS_REGION}"
}