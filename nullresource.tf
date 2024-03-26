resource "null_resource" "server-attach" {
  count = length(var.publicsubnet_cidr)
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("AWS_Default.pem")
      host        = element(aws_instance.WebServer.*.public_ip, count.index)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 777 /tmp/script.sh",
      "sudo bash /tmp/script.sh",

    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("AWS_Default.pem")
      host        = element(aws_instance.WebServer.*.public_ip, count.index)
    }
  }
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.WebServer.*.public_ip, count.index)} >> public_ip.txt"

  }
}