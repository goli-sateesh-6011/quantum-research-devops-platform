resource "aws_s3_bucket" "experiment_results" {
    bucket = "quantum-experiment-results-${random_id.bucket_id.hex}"

    tags = {
        Name        = "experiment-results"
        Environment = "dev"
    }
}

resource "random_id" "bucket_id" {
    byte_length = 4
}