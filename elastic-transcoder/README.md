## Create Content Buckets

Elastic Transcoder is not supported in ap-northeast-3.
Use ap-northeast-1 here instead.

```sh
aws s3 mb s3://videos.example-bosco --region ap-northeast-1
```

## Download Test Video MP4 File

https://file-examples.com/index.php/sample-video-files/sample-mp4-files/

## Upload Test Video

```sh
aws s3 cp "MP4 480 1.5MG.mp4" s3://videos.example-bosco/video.mp4 \
--region ap-northeast-1
```

## Create Pipeline

Create the IAM Role for Elastic Transcoder service first.

```sh
aws elastictranscoder create-pipeline \
--name my-transcoder-pipeline \
--input-bucket videos.example-bosco \
--role arn:aws:iam::660513648685:role/ElasticTranscoderDefaultRole \
--content-config file://content-config.json \
--thumbnail-config file://thumbnail-config.json \
--region ap-northeast-1
```

## Create Job

```sh
aws elastictranscoder create-job \
--pipeline-id 1720621423113-wx9x4t \
--inputs file://inputs.json \
--outputs file://outputs.json \
--output-key-prefix "videos/" \
--user-metadata file://user-metadata.json \
--region ap-northeast-1 \
--query Job.Id
```

## Read Job Details

```sh
aws elastictranscoder read-job \
--id 1720622277248-v2dfci \
--region ap-northeast-1 
```