output "subnet_public" {
  value = aws_subnet.public
}
output "SecGroupAll" {
  value = aws_security_group.allow_all
}
output "lbTarget" {
  value = aws_lb_target_group.main
}