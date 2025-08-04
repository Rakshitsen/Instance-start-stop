module "start_lambda" {
  region = var.region
  source = "./modules/lambda"
  runtime = var.runtime
  function_name = var.first_function
  index_filename = var.index_filename
  function_folder_name = var.first_function
  role_name = var.first_function
  }

module "stop_lambda" {
  region = var.region
  source = "./modules/lambda"
  runtime = var.runtime
  function_name = var.second_function
  index_filename = var.index_filename
  function_folder_name = var.second_function
  role_name= var.second_function
}

module "eventbridge1" {
  source        = "./modules/Event-bridge"
  target_id     = "start_lambda"
  lambda_arn    = module.start_lambda.lambda_arn
  lambda_name   = module.start_lambda.function_name
  time          = var.start_instance_time
}

module "eventbridge2" {
  source        = "./modules/Event-bridge"
  target_id     = "stop_lambda"
  lambda_arn    = module.stop_lambda.lambda_arn
  lambda_name   = module.stop_lambda.function_name
  time          = var.stop_instance_time
}
