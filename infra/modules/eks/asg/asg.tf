resource "aws_autoscaling_schedule" "down" {
    autoscaling_group_name = var.asg_name
    desired_capacity       = 0
    max_size               = 0
    min_size               = 0
    recurrence             = var.scaledown
    scheduled_action_name  = "ScaleDown"
    start_time             = var.stop
}

resource "aws_autoscaling_schedule" "up" {
    autoscaling_group_name = var.asg_name
    desired_capacity       = var.desired_size
    max_size               = var.max_size
    min_size               = var.min_size
    recurrence             = var.scaleup
    scheduled_action_name  = "ScaleUp"
    start_time             = var.start
}

