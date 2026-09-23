output "max_value" {
  value = max(5, 12, 9)
}

# sample Data for testing various Terraform functions

locals {
  sample_text       = "  Hello, Terraform World!  "
  raw_csv           = "name,role,department\nalice,admin,ops\nbob,dev,eng"
  list_of_strings   = ["alpha", "beta", "gamma", "alpha"]
  list_of_numbers   = [10, 42, -5, 100, 3.14]
  nested_list       = [["a", "b"], ["c", ["d", "e"]]]
  sample_map        = { env = "prod", region = "us-east-1", instances = "3" }
  json_string       = "{\"project\": \"demo\", \"enabled\": true}"
  cidr_block        = "10.0.0.0/16"
  date_string       = "2026-09-23T14:30:00Z"
}


locals {

  # --- 1. NUMERIC FUNCTIONS (7) ---
  fn_abs      = abs(-42)                      # 1. Absolute value -> 42
  fn_ceil     = ceil(3.14)                    # 2. Round up -> 4
  fn_floor    = floor(3.99)                   # 3. Round down -> 3
  fn_max      = max(10, 42, 5)                # 4. Maximum value -> 42
  fn_min      = min(10, 42, 5)                # 5. Minimum value -> 5
  fn_pow      = pow(2, 3)                     # 6. Exponentiation -> 8
  fn_signum   = signum(-15)                   # 7. Sign indicator (-1, 0, or 1) -> -1

  # --- 2. STRING FUNCTIONS (12) ---
  fn_lower       = lower("HELLo")             # 8. Convert to lowercase -> "hello"
  fn_upper       = upper("hello")             # 9. Convert to uppercase -> "HELLO"
  fn_title       = title("hello world")       # 10. Capitalize words -> "Hello World"
  fn_trimspace   = trimspace(local.sample_text)# 11. Strip surrounding whitespace -> "Hello, Terraform World!"
  fn_trimprefix  = trimprefix("v1.2.3", "v")  # 12. Strip prefix -> "1.2.3"
  fn_trimsuffix  = trimsuffix("file.txt", ".txt") # 13. Strip suffix -> "file"
  fn_replace     = replace("foo-bar", "foo", "baz") # 14. Search and replace -> "baz-bar"
  fn_substr      = substr("Terraform", 0, 5)  # 15. Extract substring -> "Terra"
  fn_join        = join("-", ["a", "b", "c"]) # 16. Concatenate with delimiter -> "a-b-c"
  fn_split       = split(",", "apple,banana,orange") # 17. Split string into list -> ["apple", "banana", "orange"]
  fn_startswith  = startswith("production", "prod") # 18. Prefix check -> true
  fn_endswith    = endswith("config.json", ".json") # 19. Suffix check -> true

  # --- 3. COLLECTION & MAP FUNCTIONS (12) ---
  fn_length      = length(local.list_of_strings)    # 20. Total item count -> 4
  fn_element     = element(["x", "y", "z"], 1)      # 21. Safe element access by index -> "y"
  fn_concat      = concat(["a"], ["b", "c"])        # 22. Combine multiple lists -> ["a", "b", "c"]
  fn_flatten     = flatten(local.nested_list)       # 23. Flatten nested lists -> ["a", "b", "c", "d", "e"]
  fn_distinct    = distinct(local.list_of_strings)  # 24. Remove duplicates -> ["alpha", "beta", "gamma"]
  fn_reverse     = reverse([1, 2, 3])               # 25. Reverse list order -> [3, 2, 1]
  fn_slice       = slice(["a", "b", "c", "d"], 1, 3)# 26. Extract sub-list -> ["b", "c"]
  fn_contains    = contains(local.list_of_strings, "beta") # 27. Check item existence -> true
  fn_keys        = keys(local.sample_map)           # 28. Extract keys from map -> ["env", "instances", "region"]
  fn_values      = values(local.sample_map)         # 29. Extract values from map -> ["prod", "3", "us-east-1"]
  fn_lookup      = lookup(local.sample_map, "env", "default") # 30. Safe map key retrieval -> "prod"
  fn_merge       = merge(local.sample_map, { team = "DevOps" }) # 31. Merge maps into one

  # --- 4. IP / NETWORK FUNCTIONS (3) ---
  fn_cidrsubnet  = cidrsubnet(local.cidr_block, 8, 2)  # 32. Calculate subnet CIDR -> "10.0.2.0/24"
  fn_cidrhost    = cidrhost(local.cidr_block, 10)      # 33. Get IP address at index -> "10.0.0.10"
  fn_cidrnetmask = cidrnetmask(local.cidr_block)       # 34. Convert CIDR to netmask -> "255.255.0.0"

  # --- 5. ENCODING & PARSING FUNCTIONS (5) ---
  fn_jsonencode  = jsonencode({ app = "web", port = 80 }) # 35. Encode map to JSON string
  fn_jsondecode  = jsondecode(local.json_string)          # 36. Parse JSON string into map/object
  fn_base64encode= base64encode("terraform-secret")       # 37. Encode string to Base64
  fn_base64decode= base64decode(local.fn_base64encode)    # 38. Decode Base64 string back to plaintext
  fn_csvdecode   = csvdecode(local.raw_csv)               # 39. Parse CSV string into list of maps

  # --- 6. HASHING & CRYPTO FUNCTIONS (4) ---
  fn_md5         = md5("my-secure-data")            # 40. Generate MD5 hash
  fn_sha1        = sha1("my-secure-data")           # 41. Generate SHA1 hash
  fn_sha256      = sha256("my-secure-data")         # 42. Generate SHA256 hash
  fn_uuid        = uuid()                           # 43. Generate dynamic UUID v4

  # --- 7. DATE & TIME FUNCTIONS (2) ---
  fn_timestamp   = timestamp()                               # 44. Get current UTC timestamp
  fn_formatdate  = formatdate("YYYY-MM-DD", local.date_string)# 45. Format timestamp string -> "2026-09-23"

  # --- 8. TYPE CONVERSION & VALIDATION FUNCTIONS (5) ---
  fn_tonumber    = tonumber("123.45")                # 46. Cast string to number -> 123.45
  fn_tostring    = tostring(99)                      # 47. Cast number/bool to string -> "99"
  fn_tobool      = tobool("true")                    # 48. Cast string to boolean -> true
  fn_toset       = toset(local.list_of_strings)      # 49. Cast list to unique set
  fn_can         = can(tonumber("not-a-number"))     # 50. Safe check if evaluation fails -> false
}

# ==============================================================================
# OUTPUTS
# ==============================================================================
output "numeric_functions" {
  value = {
    abs     = local.fn_abs
    ceil    = local.fn_ceil
    floor   = local.fn_floor
    max     = local.fn_max
    min     = local.fn_min
    pow     = local.fn_pow
    signum  = local.fn_signum
  }
}

output "string_functions" {
  value = {
    lower      = local.fn_lower
    upper      = local.fn_upper
    title      = local.fn_title
    trimspace  = local.fn_trimspace
    trimprefix = local.fn_trimprefix
    trimsuffix = local.fn_trimsuffix
    replace    = local.fn_replace
    substr     = local.fn_substr
    join       = local.fn_join
    split      = local.fn_split
    startswith = local.fn_startswith
    endswith   = local.fn_endswith
  }
}

output "collection_functions" {
  value = {
    length   = local.fn_length
    element  = local.fn_element
    concat   = local.fn_concat
    flatten  = local.fn_flatten
    distinct = local.fn_distinct
    reverse  = local.fn_reverse
    slice    = local.fn_slice
    contains = local.fn_contains
    keys     = local.fn_keys
    values   = local.fn_values
    lookup   = local.fn_lookup
    merge    = local.fn_merge
  }
}

output "network_functions" {
  value = {
    cidrsubnet  = local.fn_cidrsubnet
    cidrhost    = local.fn_cidrhost
    cidrnetmask = local.fn_cidrnetmask
  }
}

output "encoding_functions" {
  value = {
    jsonencode   = local.fn_jsonencode
    jsondecode   = local.fn_jsondecode
    base64encode = local.fn_base64encode
    base64decode = local.fn_base64decode
    csvdecode    = local.fn_csvdecode
  }
}

output "hashing_and_crypto" {
  value = {
    md5    = local.fn_md5
    sha1   = local.fn_sha1
    sha256 = local.fn_sha256
    uuid   = local.fn_uuid
  }
}

output "date_and_time" {
  value = {
    timestamp  = local.fn_timestamp
    formatdate = local.fn_formatdate
  }
}

output "type_conversion_and_validation" {
  value = {
    tonumber = local.fn_tonumber
    tostring = local.fn_tostring
    tobool   = local.fn_tobool
    toset    = local.fn_toset
    can      = local.fn_can
  }
}