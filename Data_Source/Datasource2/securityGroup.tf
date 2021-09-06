data "aws_ip_ranges" "ap_south_ip_range" {
    regions = [ "ap-south-1", "ap-east-1" ]
    services = [ "ec2" ]
  
}

resource "aws_security_group" "sg-tonyastark" {
    name = "starktony"

    ingress = [ {
      cidr_blocks = slice(data.aws_ip_ranges.ap_south_ip_range.cidr_blocks, 0, 50)
      from_port = 443
      protocol = "tcp"
      to_port = 443
    } ]
    tags = {
        CreateDate = data.aws_ip_ranges.us_east_ip_range.create_date
        SyncToken = data.aws_ip_ranges.us_east_ip_range.sync_token
    }
}
}