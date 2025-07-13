output "instance_ip" {
value = aws_instance.devops_vm.public_ip
}

output "bucket_name" {
value = aws_s3_bucket.monitoring_logs.id
}
