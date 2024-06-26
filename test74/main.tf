resource "random_integer" "priority" {
  min = 120
  max = 240
}


resource "null_resource" "previous" {}

resource "time_sleep" "wait_x_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "${random_integer.priority.result}s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_x_seconds]
}

resource "null_resource" "next2" {
  depends_on = [time_sleep.wait_x_seconds]
}