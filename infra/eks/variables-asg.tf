//Node Metabase
variable "desired_size" {
  type    = string
  default = "2"
}
variable "max_size" {
  type    = string
  default = "2"
}
variable "min_size" {
  type    = string
  default = "2"
}


//ASG Node Metabase
variable "scaledown_hml" {
    type = string
    default = "00 23 * * *"
}

variable "scaleup_hml" {
    type = string
    default = "30 10 * * *"
}

variable "stop_hml" {
    type = string
    default = null
}

variable "start_hml" {
    type = string
    default = null
}
