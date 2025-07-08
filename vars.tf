variable "rgname" {
  description = "This is the name of the resource group"
  type        = string

}

variable "rglocation" {
  description = "The location of the storage account"
  type        = string
}


variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "storageacc_name" {
  description = "The unique name given to the storage account"
  type        = string
}

