variable "name" {
  type = string
}
variable "owner" {
  type = string
}
variable "Repo_URL" {
  type = string
}
variable "subnets" {
  type = list(string)
}
variable "SecGroup" {
  type = string
}
variable "lbTarget" {
  type = string
}