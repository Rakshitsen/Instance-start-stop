# -----------------------------------------
# Archive Lambda Code
# -----------------------------------------
data "archive_file" "example" {
  type        = "zip"
  source_file = "${path.module}/../../lambda/${var.function_folder_name}/${var.index_filename}"
  output_path = "${path.module}/../../lambda/${var.function_folder_name}/function.zip"
}

# -----------------------------------------
# Lambda Function Resource
# -----------------------------------------
resource "aws_lambda_function" "example" {
  filename         = data.archive_file.example.output_path
  function_name    = var.function_name
  role             = aws_iam_role.example.arn 
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.example.output_base64sha256
  runtime          = var.runtime
  environment {
    variables = {
      ENVIRONMENT = var.env
      LOG_LEVEL   = var.log_level

    }
  }

  tags = {
    Environment = var.env
    Application = var.application
  }

}
