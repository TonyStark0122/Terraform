variable "INSTANCE_NAME" {
    default = "Stark"
    }
variable "AMI_ID" {
    type = map
    default = {
        ap-south-1 = "ami-092ad920d11fba91e"
        us-east-1  = "ami-0fa1a201fb8c369dd"
    }
    }
variable "AWS_REGION" {
    default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "tony"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "tony.pub"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}