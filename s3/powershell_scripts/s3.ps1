Import-Module AWS.Tools.s3

$region = "ap-northeast-3"
$bucketName = Read-Host -Prompt "Enter the S3 bucket name"

Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

function BucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

# Check if the S3 bucket exists
if (-not (BucketExists)) {
    Write-Host "Bucket does not exist..."
    Start-Sleep -Seconds 1 # Wait for the s3 process to complete, prevent a conflict with the operation on the bucket.
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    Write-Host "Bucket already exists..."
}

# Create a new file
$fileName = "myfile.txt"
$fileContent = "Hello, World!"
Set-Content -Path $fileName -Value $fileContent 

# Upload the file to S3
Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName