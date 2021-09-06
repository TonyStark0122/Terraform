variable "INSTANCE_NAME" {
    default = "TonyStark"
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
