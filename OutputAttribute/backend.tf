terraform {
    backend "s3" {
        bucket  = "terraform.pepper"
        key     = "dev/terraform_state"
        region  = "ap-south-1"
    }
}