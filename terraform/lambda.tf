
data "archive_file" "lambda" {
  source_file = "${path.module}/../bin/lambda/main"
  output_path = "${path.module}/../bin/lambda.zip"
  type        = "zip"
}


resource "aws_lambda_function" "hello_world" {
  function_name    = "HelloWorldLambda"
  role             = aws_iam_role.hello_world.arn
  handler          = "main"
  runtime          = "go1.x"
  timeout          = 15
  memory_size      = 128 # in MB
  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
}

resource "aws_cloudwatch_log_group" "hello_world" {
  name              = "/aws/lambda/${aws_lambda_function.hello_world.function_name}"
  retention_in_days = 3
}

