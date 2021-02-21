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

variable "private_ips" {
  type = list(string)
  default = ["10.0.1.50","10.0.1.51"]
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

 variable accessKey {default = "ASIAXZL3GDEHLJBDVL4R"}
 variable secretKey {default = "lBTb4egYXoYCMTQI847QXpmu7/NKbGfbxRBDiX1G"}
 variable sessionToken {default = "IQoJb3JpZ2luX2VjELr//////////wEaCXVzLWVhc3QtMSJIMEYCIQCk7gO370vRHbbePrOZ/YRpEAkAqXrQklQL/TlMUcbNmgIhAJ3WkX8fjctTFqH+eeoiMiRxa8xsZ/UkhbuKMNbdG66TKp0DCMP//////////wEQAhoMNTM1NTE4NjQ4NTkwIgzV8sKWnoYDzP6FakQq8QKkhSWkw8EjHbBAOQnCcnEGZeAZkeyDMd75SOnheMQu46/aCYpBi1b4zu33jK9CZbnh15/ZmTCetcgUIKQi+dcVzRVvgHC18+I/DTqJ6LO058LotAxJml947mfY2iy/tJXOXxbZ6ihfa/AClFoJhOyRfRwBurvYBHlAZnRzHfaQfJ4Ts1eg3BGROXeY4UGF4MaYKI40DednB6nKmJxNdfxlYcAbKNsSBNHXdHM5GPe6dra+iEC0VCLhHAJHDhfmqNWyRiR81VrLsFu3l95FCiP218DUrOPpHu+ytYd77gMXZwVyXKxUnokjKG9kQb2zhZtQu4w0Bh33hA0OgJQ5GiMvIrXVFCDu9arCwwYWCfPiTFWVY+rTUjrUI0rg5AgwR/WONb8WUEqFThv96IQqJxX1L+1rcWLHb7roDmk9gp7n0IispUbRBoAT9B4vPqPLqv1DIgBRkK58d+uy00E4mBOIRkMvUCVHDegHhlhrBcGl6ygwsrbKgQY6pQHMUHB488q0lCidzD6fWxEcitp+HyZdA4I7F3Ebcob7hTMHrTarfy+XAnC5K2y89haFfhHLgUPtFEnYwZ25Ji2h0zswhyvhzx+/HqmVkRBzOUcSkPXF8275KpioeN7wFBZKLhGaLenrtRjQ5VWG9RO4N127NZsaQMZDC2zSIYFbfeS6TV5jndxfYnw/tEYIyiWSxLU5EF+tAr+317ui53YrInp0S/Q="}
 variable publicKey {default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjdwFosz2AFOmG1vL4sWwKIPdGkZf+pJdA933hyzbhSzDu78fyb6vf2cgf/09TMTELA38jvnhKKVMfORPvhlRNxc0ImidFtvY+nlF1WTXr1iN05IAlCodILlJ9UVq1Y6VrewTnh04zqy51e6ArVbghjzeHiDd2IAc72LFUSfoD399IBEqT8s8mynDIqaCJIZdds30GZsY4OR3v6S0Qw/j3hgJgVpjyc4ZEBOadeNLt31KeilBH3bjfDVyweKAnKEWtKsf60CiSmsBrMPuYyZ7BjUJ5aXtlWLD5ftUEfJXqHVwvDT6z1cqiUd00oagLovomg45/KLGXBjsAHc1xKldEagr9fObeAhL081M9mvQpb/kf4/+BBZ9y3fK9TShIZ39/IxrEgI/pcYiNKaQw2x2vzAtXLC2/67qq9O5q3BoF/pVUkf+VKzc/U/jumsQRb6EUyT2XQL2NqibtAoDCNHQDsbguqd+DGmNMX6H5A7AGUfqXgdWlTXE4OZHazGDupE8= danielov@Daniels-Mac.local"}
