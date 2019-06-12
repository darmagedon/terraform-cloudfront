data "aws_route53_zone" "zone" {
  name         = "${var.domain_configuration["root_domain"]}"
  private_zone = false
}

resource "aws_route53_record" "cert_validation" {
  name    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.zone.id}"
  records = ["${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

resource "aws_route53_record" "domain_name" {
  zone_id = "${data.aws_route53_zone.zone.id}"
  name = "${var.domain_configuration["domain"]}"
  type = "CNAME"
  records = ["${aws_cloudfront_distribution.www_distribution.domain_name}"]
  ttl = 60
}
