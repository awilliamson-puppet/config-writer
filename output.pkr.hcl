

source "docker" "example" {
  image  = "ubuntu:xenial"
  commit = true
}

source "docker" "example-bionic" {
  image  = "ubuntu:bionic"
  commit = true
}


build {
  sources = [
    "Test-Image-1"
  ]

  provisioner "file" {
    
    Destination = "C:\temp\LabBuildSteps\${var.lab_id}"
    Source = "./PE101-Lab-2-1"
    
  }

  provisioner  "powershell"  {
    environment_vars = [
      "Windows",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt"
    ]
  }
}

build {
  sources = [
    "Test-Image-2"
  ]

  provisioner "file" {
    
    Destination = "/tmp/LabBuildSteps/${var.lab_id}"
    Source = "./PE101-Lab-2-1"
    
  }

  provisioner  "shell"  {
    environment_vars = [
      "Linux",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt"
    ]
  }
}
