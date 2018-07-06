resource "aws_eip" "ip" {
  instance = "${aws_instance.appserver.id}"
  depends_on = ["aws_instance.appserver"]
}