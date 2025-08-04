# -----------------------------------------
# IAM Role Trust Policy for Lambda
# -----------------------------------------
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# -----------------------------------------
# IAM Role Creation
# -----------------------------------------
resource "aws_iam_role" "example" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# -----------------------------------------
# IAM Policy Attachments
# -----------------------------------------
# 1. Logging to CloudWatch
resource "aws_iam_role_policy_attachment" "lambda_logging" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# 2. Optional EC2 access (if needed)
resource "aws_iam_role_policy_attachment" "lambda_ec2_full_access" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
