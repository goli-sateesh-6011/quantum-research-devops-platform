output "master_id" {
    value = aws_instance.k8s_master.public_ip
}

output "worker_ips" {
    value = aws_instance.k8s_workers[*].public_ip
}

output "s3_bucket" {
    value = aws_s3_bucket.experiment_results.bucket
}

output "ssh_master" {
  value = "ssh -i terraform-k8s-key.pem ubuntu@${aws_instance.k8s_master.public_ip}"
}