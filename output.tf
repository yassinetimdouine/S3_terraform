output "K8s-SA-Annotation" {
  value = "eks.amazonaws.com/role-arn: ${aws_iam_role.demo-bucket.arn}"
}                           