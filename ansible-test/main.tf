resource "null_resource" "run-ansible-playbook" {

/*
  provisioner "local-exec" {
      command = "ping ${var.ansible_host_addr}"
  }
*/
  count = "${var.instances}"

  connection {
    type = "ssh"
    host = "${var.ansible_host_addr}"
    timeout = "30s"
    agent = false 
    user = "${var.user}"
#    password = "${var.password}"
    private_key = "${base64decode(var.ssh_private_key)}"
  }

  provisioner "remote-exec" {
    inline = [
     "uname -an"
    ]
  }


/*
  provisioner "remote-exec" {
    inline = [
     "ansible-playbook ~/ansible-samples/${var.app}.yml -e 'ansible_python_interpreter=/usr/bin/python3' -i ${var.ansible_host_addr}  ,",
    ]
  }
*/

#  depends_on = ["vsphere_virtual_machine.vm"]

}