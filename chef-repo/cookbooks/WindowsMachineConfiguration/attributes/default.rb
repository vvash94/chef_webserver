#AWS_S3_Bucket
default["AWS_S3_Bucket"]["S3AccessKey"]= "AKIAIXEVFFPQV4LBPDSA"
default["AWS_S3_Bucket"]["S3SecretKey"]= "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"
default["AWS_S3_Bucket"]["S3BucketName"]= "surecheckwebserver"
default["AWS_S3_Bucket"]["S3Region"]= "eu-west-1"
default["AWS_S3_Bucket"]["S3SavingPath"]= "C:\\s3-downloads\\"

#Anti Virus
default["AntiVirus"]["FolderName"]= "System Center Endpoint Protection 2012 r2 SP1"
default["AntiVirus"]["FileName"]= "System Center Endpoint Protection 2012 r2 SP1.zip"
default["AntiVirus"]["FilePath"]= "C:\\s3-downloads\\System Center Endpoint Protection 2012 r2 SP1.zip"
default["AntiVirus"]["InstallableFilePath"]= "C:\\s3-downloads\\System Center Endpoint Protection 2012 r2 SP1\\SCEPInstall.exe"
default["AntiVirus"]["InstallableFileName"]= "SCEPInstall.exe"
default["AntiVirus"]["UnZipPath"]= "C:\\s3-downloads\\"
default["AntiVirus"]["InstallerName"]= "Microsoft Forefront Endpoint*"

#Local Node OS configurations
default["OS_Configure"]["adminName"] = "admin_GGKTech"
default["OS_Configure"]["adminPassword"] = "Welcome@1234"
default["OS_Configure"]["TimeZone"] = "India Standard Time"

#Firewall Rules
default["OS_Configure"]["firewallRules"]=[
                                        {
                                          'firewallName' => "WebServer",
                                          'protocol' => "tcp",
                                          'direction' => "in",
                                          'action' => "allow",
                                          'profile' => "Any",
                                          'localport' => 80,
                                          'program' => "Any",
                                          'remoteip' => "Any"
                                        }
                                      ]

#Windows Roles & Features
default["WindowsFeaturesAndRoles"]["ValuesToAdd_Array"] = [
                                    {
                                      'FeatureName' => "Net-Framework-Features",
                                      'EnsureValue' => "Present",
                                      'InstallAllSubFeature' => "$true"
                                    },
					                          {
                                      'FeatureName' => "NET-Framework-45-Core",
                                      'EnsureValue' => "Present",
                                      'InstallAllSubFeature' => "$true"
                                    },
                                    {
                                      'FeatureName' => "Telnet-Client",
                                      'EnsureValue' => "Present",
                                      'InstallAllSubFeature' => "$true"
                                    },
                                    {
                                      'FeatureName' => "Web-Server",
                                      'EnsureValue' => "Present",
                                      'InstallAllSubFeature' => "$true"
                                    }
                                  ]
