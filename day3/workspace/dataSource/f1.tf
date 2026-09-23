locals {
  sample_text     = "  Hello, Terraform World!  "
  raw_csv         = "name,role,department\nalice,admin,ops\nbob,dev,eng"
  list_of_strings = ["alpha", "beta", "gamma", "alpha"]
  list_of_numbers = [10, 42, -5, 100, 3.14]
  nested_list     = [["a", "b"], ["c", ["d", "e"]]]
  sample_map      = { env = "prod", region = "us-east-1", instances = "3" }
  json_string     = "{\"project\": \"demo\", \"enabled\": true}"
  cidr_block      = "10.0.0.0/16"
  date_string     = "2026-09-23T14:30:00Z"
}


# output "trimmed_text" {
#   value = trim(local.sample_text, "  Hello")
# }
# output "upper_text" {
#   value = upper(local.sample_text)
# }
# output "lower_text" {
#   value = lower(local.sample_text)
# }
# output "title_text" {
#   value = title(local.sample_text)
# }
# output "replaced_text" {
#   value = replace(local.sample_text, "Terraform", "TF")
# }
# output "substring_text" {
#   value = substr(local.sample_text, 2, 5)
# }
# output "abs_value" {
#   value = abs(-42)
# }

# output "md5sum" {
#   value = md5(local.sample_text)
# }

# output "cidersubnet" {
#   value = cidrsubnet(local.cidr_block, 10, 3)
#   # 10.0.0.0/16
# }