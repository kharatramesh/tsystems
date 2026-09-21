# variable "bname" {
#   type        = string
#   description = "The name of the bucket to create"
#   default     = "trainer-vadapav-bucket"
# }

variable "bname" {
  type        = list(string)
  description = "The name of the bucket to create"
  default     = ["trainer-vadapav-bucket1", "trainer-pizza-bucket2", "trainer-burger-bucket3"]
}

variable "akey" {
  type        = string
  description = "The access key for the AWS account"
  sensitive   = true
  default     = "AKIA"
}

variable "skey" {
  type        = string
  description = "The secret key for the AWS account"
  sensitive   = true
  default     = "wp3"
}
variable "region" {
  type        = string
  description = "The AWS region to create the bucket in"
  default     = "ap-south-1"
}