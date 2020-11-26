variable "name" {
  type = string
}
variable "owner" {
  type = string
}

variable "loadbalancer_arn" {
  type = string
}

variable "res_threshold" {
  type    = number
  default = 1
}