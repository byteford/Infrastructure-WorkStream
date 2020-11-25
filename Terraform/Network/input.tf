variable "name" {
  type = string
}
variable "owner" {
  type = string
}
variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b"]
}