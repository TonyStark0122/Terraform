data "aws_ip_ranges" "ap_ip_range" {
    regions = ["ap-south-1","ap-east-1"]
    services = ["ec2"]
}

resource "aws_security_group" "sg-custom_tony" {
    name = "custom_tony"

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = slice(data.aws_ip_ranges.ap_ip_range.cidr_blocks, 0, 10)
    }

    tags = {
        CreateDate = data.aws_ip_ranges.ap_ip_range.create_date
        SyncToken = data.aws_ip_ranges.ap_ip_range.sync_token
    }
}