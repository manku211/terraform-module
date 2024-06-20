variable "web_instance_ids" {
  description = "List of web instance IDs"
  type        = list(string)
  # You can add any other constraints if needed
}

variable "vpc_ids" {
  description = "List of web instance IDs"
  type        = string
  default     = "vpc-0aba667bc684cbc47"
}

variable "subnet_ids" {
   description = "List of subnet IDs"
  type        = list
  default     = ["subnet-05a0e4240292ea43e","subnet-004522a5f69303158"]
}