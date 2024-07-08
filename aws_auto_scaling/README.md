AWS Auto Scaling does not automatically turn resources into scalable resources.

## Create EC2 Instance as a resource to scale

```sh
chmod u+x deploy
./deploy
```

## Manually create scaling plan using AWS UI

Since AWS doesn't provide auto-scaling service in ap-northeast-3, use ap-northeast-1 instead.<br>
https://console.aws.amazon.com/awsautoscaling/home?region=ap-northeast-1