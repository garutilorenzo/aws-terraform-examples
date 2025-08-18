data "aws_availability_zones" "available_az" {
  state = "available"
}

data "aws_availability_zone" "az" {
  for_each = toset(data.aws_availability_zones.available_az.zone_ids)
  zone_id  = each.key
}