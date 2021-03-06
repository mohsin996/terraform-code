## Deploy a single web server
provider "aws" {
        region     = "ap-south-1"

 }
  resource "aws_instance" "example" {
         ami                    =  "ami-0d773a3b7bb2bb1c1"
         instance_type          = "t2.micro"
         key_name               = "mohsinkhan996"
	 vpc_security_group_ids = ["${aws_security_group.instance.id}"]
		 
         user_data = <<-EOF
		    #!/bin/bash
	            echo "Hello, World THIS IS TERRAFORM" > index.html
	            nohup busybox httpd -f -p 8080 &
	            EOF
					
	tags { 
		Name = "web1" 
        }
}
  resource "aws_security_group" "instance" {
	name = "terraform-webserver"

	ingress {
	  from_port   = 8080 
	  to_port     = 8080
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]	
 }
}
  output "public_ip" {
   value = "${aws_instance.example.public_ip}"
}
