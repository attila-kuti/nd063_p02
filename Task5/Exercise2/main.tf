provider "aws" {
  profile = "attila.kuti1"
  region = "us-east-1"
}



resource "aws_iam_role" "iam_role_for_lambda" {
  name = "iam_role_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Here is the lambda function that will run the code `greet_lambda.handler`
module "lambda" {
  source  = "./lambda"
  name    = "greet_lambda"
  handler = "lambda_handler"
  runtime = "python2.7"
  role    = aws_iam_role.iam_role_for_lambda.arn
}

