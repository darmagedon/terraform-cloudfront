resource "aws_acm_certificate" "certificate" {
  // We want a wildcard cert so we can host subdomains later.
  domain_name       = "*.${var.domain_configuration["root_domain"]}"
  validation_method = "DNS"

  // We also want the cert to be valid for the root domain
  subject_alternative_names = ["${var.domain_configuration["root_domain"]}"]
}

resource "aws_acm_certificate_validation" "certificate" {
  certificate_arn         = "${aws_acm_certificate.certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}