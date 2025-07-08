# # # Fetch existing Route 53 hosted zone
# # data "aws_route53_zone" "main" {
# #   name         = var.domain_name
# #   private_zone = false
# # }

# # Create Route 53 record
# resource "aws_route53_record" "app" {
#   zone_id = var.zone_id
#   # name    = var.create_subdomain ? var.subdomain : var.domain_name
#   name    = "threatmodel.kowser.co.uk"
#   type    = "CNAME"
#   ttl     = var.ttl
#   records = [var.alb_dns_name]

#   depends_on = [data.aws_route53_zone.main]
# }

# # Optional: Create ALIAS record instead of CNAME
# resource "aws_route53_record" "app_alias" {
#   count = var.use_alias_record ? 1 : 0

#   zone_id = data.aws_route53_zone.main.zone_id
#   name    = var.create_subdomain ? var.subdomain : var.domain_name
#   type    = "A"

#   alias {
#     name                   = var.alb_dns_name
#     zone_id                = var.alb_zone_id
#     evaluate_target_health = var.evaluate_target_health
#   }

#   depends_on = [data.aws_route53_zone.main]
# }



# Route 53 record for pointing to ALB (choose CNAME or ALIAS based on `use_alias_record`)

# CNAME record (used only if NOT using ALIAS)
resource "aws_route53_record" "app" {
  count   = var.use_alias_record ? 0 : 1

  zone_id = var.zone_id
  name    = var.subdomain
  type    = "CNAME"
  ttl     = var.ttl
  records = [var.alb_dns_name]
}

# ALIAS A record (used only if `use_alias_record = true`)
resource "aws_route53_record" "app_alias" {
  count   = var.use_alias_record ? 1 : 0

  zone_id = var.zone_id
  name    = var.subdomain
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}
