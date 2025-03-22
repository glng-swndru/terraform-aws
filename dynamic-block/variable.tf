# variable.tf
variable "ingress_rules" {
  default = [
    {
        from_port   = 80,
        to_port     = 80,
        protocol    = "tcp",
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port   = 22,
        to_port     = 22,
        protocol    = "tcp",
        cidr_blocks = ["1.2.3.4/32"]
    }
  ]
}