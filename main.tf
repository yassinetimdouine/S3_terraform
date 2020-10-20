

#Creation AWS S3 
resource "aws_s3_bucket" "y" {
  bucket = "velero-bucket-s3"
  acl = "private"
  force_destroy = true
  
  depends_on = [
    aws_iam_role_policy_attachment.demo-bucket-velero-policy-tf,
  ]

}

#Creating an AWS IAM role with assume_role_policy
resource "aws_iam_role" "demo-bucket" {

  name = "velero-role-tf"
  
  assume_role_policy = templatefile("trust-policy.json", {})
}

#Creating an AWS IAM Polcy
resource "aws_iam_policy" "velero-policy-tf" {
  name        = "velero-policy-tf"
  policy = templatefile("velero-policy-tf.json", {})
}

#Attaching the policy to the role
resource "aws_iam_role_policy_attachment" "demo-bucket-velero-policy-tf" {
  policy_arn = "arn:aws:iam::181151069204:policy/velero-policy-tf"
  role       = aws_iam_role.demo-bucket.name
}
