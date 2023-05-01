variable "desired_size" {
    type = string
    description = "Desired number of worker nodes."
}

variable "max_size" {
    type = string
    description = "Maximum number of worker nodes."
}

variable "min_size" {
    type = string
    description = "Minimum number of worker nodes."
}

variable "scaledown" {
    type = string
    description = "ASG scale down cron config"
}

variable "scaleup" {
    type = string
    description = "ASG scale up cron config"
}

variable "stop" {
    type = string
    description = "Next stop config"
}

variable "start" {
    type = string
    description = "Next startup config"
}

variable "asg_name" {
    type = string
    description = "Name of the Node Group ASG."
}

