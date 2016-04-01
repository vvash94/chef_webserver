#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: APP_Antivirus
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

removeOldVersion do
  filePath node["AntiVirus"]["FilePath"]
  fileName node["AntiVirus"]["InstallableFilePath"]
  folderName (node["AntiVirus"]["UnZipPath"]+node["AntiVirus"]["FolderName"])
  savingPath node["AWS_S3_Bucket"]["S3SavingPath"]
end

download_From_S3 do
  accessKey node["AWS_S3_Bucket"]["S3AccessKey"]
  secretKey node["AWS_S3_Bucket"]["S3SecretKey"]
  region node["AWS_S3_Bucket"]["S3Region"]
  fileName node["AntiVirus"]["FileName"]
  bucketName node["AWS_S3_Bucket"]["S3BucketName"]
  filePath node["AntiVirus"]["FilePath"]
  savingPath node["AWS_S3_Bucket"]["S3SavingPath"]
  unZipPath nil#["AntiVirus"]["UnZipPath"]
end
#
# installExe do
#   filePath node["AntiVirus"]["InstallableFilePath"]
#   installerName node["AntiVirus"]["InstallerName"]
# end
#
# #Perform Signature Updates
# dsc_script 'Update Signatures' do
#   code <<-EOH
#       Script ScheduleTask
#           {
#               GetScript =
#               {
#               }
#               SetScript =
#               {
#                 Import-Module "$env:ProgramFiles\\Microsoft Security Client\\MpProvider"
#                 Update-MProtSignature -UpdateSource MicrosoftUpdateServer
#               }
#               TestScript =
#               {
#                 $false
#               }
#           }
#   EOH
# end
