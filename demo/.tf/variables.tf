variable "region" {
  default = "us-east-1"
}


variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "az" {
  default = "us-east-1a"
}

variable "prefix" {
  default = "chlng"
}

variable "private_ip_s1" {
  type = list(string)
  default = ["10.0.1.50"]
}

variable "private_ip_s2" {
  type = list(string)
  default = ["10.0.1.51"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "chlng"
}

variable "subnet_block" {
  default = "10.0.1.0/24"
}

 variable accessKey {default = "ASIAXZL3GDEHALL7FPND"}
 variable secretKey {default = "jzVHdRaC4MubmNDSpLvg37CjXsGy87yB6RI9mZ6U"}
 variable sessionToken {default = "IQoJb3JpZ2luX2VjEMv//////////wEaCXVzLWVhc3QtMSJIMEYCIQC7Q8ROvNle8HwC4ysk2O3X4jNwR8D6gvzJwW5jePq6iwIhAN2C8srV0EzRwEprDshsGNyYPsUemfS11skmAFZle9dwKp0DCNT//////////wEQAhoMNTM1NTE4NjQ4NTkwIgwKieI3STLT+2PL0ssq8QJjuCg4s3Z/DK14ioNWNl1uHuqLhjIwO80XqSPl9b7J2CmpcRC2RKtbaYq+W5ibANiq4glbBc1e++4ua+pTwM6gfW23fmC3sRQI2WKQ+mnnR0gcaIBHN38/sYhi9ESAAkXLAExHNlKJ7rTOYdeosCKOSItreWX8ZkXXiMeqo5fOp0KXCmYffhVD34aW17Mwmcc3QiMu99F3BCBM1lVkTt3jfEQ39CbDnA09HSFV70DQ3f5JToTR7+oMcEZny9FOMGm1hD61dJPFGcuK18SiUB2Vsf9xkw2Rma6d32BQNfgjPJTn6J+rc56tN/t0YuMQW6MKJBpOR2NKtriOOacFB6izHMSTMMFF6yyayq+xJl7faYJB4b78oXxtNq4gYSjF8zwaOLBuj0KTzaOGvuK8BsGTCjdCWewDd9zXXTJ+FYRbsygNksSRYaWD+HurlqZVYjcP7c5h88Ar6PZla8k+02abcBFf7OENWKEHyihmej/NXX8w1ZHOgQY6pQEaB9xR0wYwk9PkZSqmAGqi+K8DBzfPt255d2WYAX5ueDx07S2rsIzNC6ZhSQocXpjhsW6JWrPK4iqJjipnv1TJ6xMBQ7CtolD5gzDCrb7SYv4gkqtlk2aMhZMJzCm5LDi+HXM8bgozWlXKCIutatiV3AZGsRkGI6fVXTgKMCn1mJ6pAVC8yPQsydwlZCjinmYuEZoDIm6oAPe+9TCt9B2XGt+As14="}
 variable publicKey {default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDECDx0KEk/dcM0M8Soqeu6qrNPddT5gIErPr+KbaKRW1hC76NnuJfgZIK5W4k0WCtlY3Lw2RPKBYdzluqXqbdnBgkeFOH0L90U9dmaJZmmE9l/PeXr+2PUCr0zkLeGJAt9DSnRqAEgVSF/fi8RAkTL5qAtZSyFhUeTQHournCSF5e+iiSThPhoVWAfeowGmVosRuL8WPVSiiW1kdao4NPnRJY9zOa8Lzhc5vbdnUtkG1/vlXmSDMn2FVA0SlXhmTbHsYV8UICCzTvAyEJKEpZ9WUa5aINVWghUoDk6wvsTj8qK5Mm0av9DkPB67TZ+ua5jog2jKvEyoWXIepVIvAJXdwVwRlICyFaBJXXjn+qHFQxasr7ZtnsqEz/E2Ouw16PWA8YzF9Yi4FKKRbC1CzbzK8GfCPZ6mTc26b63W/OTyITGxVTVotqLi2ZV8myuNMzH8UQ4P5ra9uU5QcCAa47DnyxK5p0Ru0xOI510snRvpWrCSztuPuWw7WN1OmJwb1U= danielov@Daniels-Mac.local"}
