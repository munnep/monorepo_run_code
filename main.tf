resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "60s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_30_seconds]
}

resource "null_resource" "next2" {
  depends_on = [time_sleep.wait_30_seconds]
}

resource "null_resource" "next3" {
  depends_on = [time_sleep.wait_30_seconds]
}