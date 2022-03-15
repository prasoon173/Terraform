terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.13.0"
    }
  }
}

provider "google" {
  #version = "3.5.0"
  credentials = file("terraform-key.json")


  #region  = "us-central1"
  #zone    = "us-central1-a"
}

module "test-terraform-module" {
  source      = "../modules/"
  bucket_name = "prasoon-15-03-2022"
  project_id  = "just-advice-335915"
  #zone = "us-central1-a"
  #machine_type = "e2-medium"




}
output "gcs_bucket_name" {
  value = module.test-terraform-module.gcs-bucket

}
output "instance" {
  value = module.test-terraform-module.compute-engine
  sensitive = true

}
output "gcs_link" {
  value = module.test-terraform-module.self_link
    
  }
  




/*
terraform {
  backend "gcs" {
    bucket = "tf-state-prod" 
    prefix = "terraform/state" 
    credentials ="terraform-key.json" 
    
    }
    }
*/