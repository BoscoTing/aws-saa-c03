import boto3
from botocore.client import Config

my_config = Config(
    region_name='ap-northeast-1',
)

personalize_runtime = boto3.client(
    service_name='personalize-runtime', 
    config=my_config,
)

campaign_arn = \
    'arn:aws:personalize:ap-northeast-1:660513648685:campaign/my-campiagn'
user_id = '83'
item_id = '1'

def get_user_recommendations(
    campaign_arn, user_id, item_id
):
    try:
        response = personalize_runtime.get_recommendations(
            campaignArn=campaign_arn,
            userId=user_id,
            itemId=item_id,
        )
        items = response['itemList']
        print("Recommended items:")
        for item in items:
            print(f"Item ID: {item['itemId']}, Score: {item.get('score', 'N/A')}")
    except Exception as e:
        print(f"Error getting recommendations: {e}")

get_user_recommendations(campaign_arn, user_id, item_id)