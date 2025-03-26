#!/bin/bash
###############################################
#Description: This code is for hosting the static website
#1. first upload your .html file in the vm
#2. we write the code if the cli is install or not if not you need to install
#3. then it read the input from the user
#4. it check bucket name is aleardy there or not if not it create bucket
#5. for hosting static website we need to enable public acess that what we written the code
#6. upload all the file in the s3
#7. for creating static website we need to enable static webhosting
#8. finall you need to run the link at bottom
# Ensure AWS CLI is installed and configured
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Please install it and configure your credentials."
    exit 1
fi

# Prompt the user for bucket name, region, and source directory.
read -p "Enter the S3 bucket name: " BUCKET_NAME
read -p "Enter the AWS region (e.g., us-east-1): " REGION
read -p "Enter the path to your website files: " SOURCE_DIR

# Create S3 bucket if it doesn't exist
if ! aws s3 ls s3://$BUCKET_NAME &> /dev/null
then
    echo "Creating S3 bucket: $BUCKET_NAME"
    aws s3 mb s3://$BUCKET_NAME --region $REGION

    # Disable Block Public Access explicitly
    aws s3api put-public-access-block \
        --bucket $BUCKET_NAME \
        --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
else
    echo "S3 bucket $BUCKET_NAME already exists."
fi

# Upload files to S3 bucket
echo "Uploading website files to S3 bucket..."
aws s3 sync $SOURCE_DIR s3://$BUCKET_NAME --delete

# Set bucket policy to allow public read access
POLICY='{"Version":"2012-10-17","Statement":[{"Sid":"PublicReadGetObject","Effect":"Allow","Principal":"*","Action":["s3:GetObject"],"Resource":["arn:aws:s3:::'$BUCKET_NAME'/*"]}]}'
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy "$POLICY"

# Enable static website hosting
aws s3 website s3://$BUCKET_NAME/ --index-document index.html --error-document error.html

echo "Website deployed successfully!"
echo "Website URL: http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

