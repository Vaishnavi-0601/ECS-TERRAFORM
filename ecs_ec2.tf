resource "aws_launch_template" "ecs_lt" {
 name_prefix   = "ecs-template"
 image_id      = "ami-0c7217cdde317cfec"
 instance_type = "t2.micro"

 key_name               = "ec2ecsglog"
 vpc_security_group_ids = [aws_default_security_group.default.id]
 iam_instance_profile {
   name = "AWSServiceRoleForAutoScaling"
 }

 block_device_mappings {
   device_name = "/dev/xvda"
   ebs {
     volume_size = 30
     volume_type = "gp2"
   }
 }

 tag_specifications {
   resource_type = "instance"
   tags = {
     Name = "ecs-instance"
   }
 }

 user_data = filebase64("${path.module}/ecs.sh")
}