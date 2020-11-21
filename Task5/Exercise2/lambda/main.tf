

resource "aws_lambda_function" "lambda" {
  filename      = "${var.name}.zip"
  function_name = var.name
  role          = var.role
  handler       = "${var.name}.${var.handler}"
  runtime       = var.runtime
}

output "name" {
  value = aws_lambda_function.lambda.function_name
}
