variable "ami" {  
    type = string
}    

variable "instance_type" {  
    type = string
}  

variable "network_interface_id" {  
    type = string
}  

variable "security" {  
    type = list(string)
}  

