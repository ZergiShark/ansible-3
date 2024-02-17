variable "yandex_cloud_id" {
  default = "b1gabgqhu33uc3kc5gp1"
}

variable "yandex_folder_id" {
  default = "b1g2g7h90nf60krkqnsi"
}

variable "default_zone" {
  default = "ru-central1-a"
}

variable "centos-7" {
  default = "fd80hokdubc6pj50kvsd"
}

variable "instance_cores" {
  default = "2"
}

variable "instance_memory" {
  default = "2"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

