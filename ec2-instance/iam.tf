resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile-${var.environment}"
  role = aws_iam_role.ec2_iam_role.name

  tags = merge(
    local.tags,
    {
      "Name" = lower("ec2-instance-profile-${var.environment}")
    }
  )
}

resource "aws_iam_role" "ec2_iam_role" {
  name = "ec2-iam-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    local.tags,
    {
      "Name" = lower("ec2-iam-role-${var.environment}")
    }
  )
}

resource "aws_iam_role_policy_attachment" "attach_ssm_policy" {
  role       = aws_iam_role.ec2_iam_role.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}