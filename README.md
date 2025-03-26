# Hosting Static Website in S3 bucket

##Prequesite
AWS account
AWS cli Install and configure and connect to aws cli you can check by using command aws --version and aws s3 ls this commands will cli install and how many s3 bucket are there

## Running the code
1. Clone the git in your aws cli
2. Run the following command  bash bucket.sh or you can change the permission to set by running this command chmod +x bucket.sh and run ./bucket.sh
3. it will ask the bucket name you need to give bucket name as unique if aleardy have the bucket name the code will exit and you need to give the region where you want to create and give the path of your website file
4. After that it will show you below output in the teminal
   ![image](https://github.com/user-attachments/assets/063df683-70a5-4b65-be35-31c609623d5c)
5. Click on the link you will see the website hosting in the s3 domain-![image](https://github.com/user-attachments/assets/c0bc6724-4e72-4b4f-888f-de9a3ce7865c)
6. Login to your aws account and navigate the s3 bucket it will create the bucket this like ![image](https://github.com/user-attachments/assets/75e1acfe-5240-4640-a559-536d3862800b)
7. check the bucket has public access available and files are uploaded and  static website is enabled. Attaching the screenshot for your reference
   ![image](https://github.com/user-attachments/assets/e812544a-dd4b-4c1f-97f6-26e2795d0f85)
   ![image](https://github.com/user-attachments/assets/b25ad239-d014-4268-8265-f76819448979)
   ![image](https://github.com/user-attachments/assets/c00fb569-0f72-4534-9d0d-e48d42cde483)
