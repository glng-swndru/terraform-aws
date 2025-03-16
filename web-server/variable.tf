#variable.tf
variable "instance_type" {
  description   = "The type of instance to start"
  type          = string
  default       = "t2.micro"
}

variable "region" {
    description     = "The region in which to launch the instance"
    type            = string
    default         = "us-west-2"
}

variable "instance_count" {
    description     = "The number of instances to launch"
    type            = number
}