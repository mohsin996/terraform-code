## Deploy a single server

	provider "aws" {

        region     = "ap-south-1"


 }
  resource "aws_instance" "example" {
         ami          =  "ami-0ad42f4f66f6c1cc9"
         instance_type = "t2.micro"
         key_name     = "mohsinkhan996"
		
   tags { 
		Name = "one-server" 
        }
} 
