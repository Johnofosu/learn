variable "region" {
    default = "eu-west-1"
    type = string
    description = "default region"
  
}

variable "region1" {
    default = "us-west-1"
    type = string
    description = "alias region"

}

variable "user" {
  default = "ama-konadu"
  type = string 
  description = "user name"
}

variable "tag" {
    default = "ama-konadu"
    type = string
    description = "tag name"
  
}

variable "policyname" {
    default = "s3-policy"
    type = string
    description = "user policy name"
  
}

variable "server1" {
    default = "ami-0c38b837cd80f13bb"
    type = string
    description = "server 1 in default region eu-west-1"
  
}

variable "tagName1" {
    default = "ama-server1"
    type = string
    description = "tag name for server 1"
  
}

variable "server2" {
    default = "ami-0ff591da048329e00"
    type = string
    description = "server 2 in alias region us-west-1"
}

variable "tagName2" {
    default = "ama-server2"
    type = string
    description = "tag name for server 2"
}