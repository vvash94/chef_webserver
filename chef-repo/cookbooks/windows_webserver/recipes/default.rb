#
# Cookbook Name:: windows_webserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

dsc_script 'Web-Server' do
  code <<-EOH
  WindowsFeature InstallWebServer
  {
    Name = "Web-Server"
    Ensure = "Present"
  }
  EOH
end

dsc_script 'Web-Asp-Net45' do
  code <<-EOH
  WindowsFeature InstallDotNet45
  {
    Name = "Web-Asp-Net45"
    Ensure = "Present"
  }
  EOH
end

dsc_script 'Download-Artifacts' do
  code <<-EOH
  Script Download-Artifacts{
    GetScript={ $true }
    SetScript={
      $source = "https://s3-us-west-1.amazonaws.com/ashishbucket/MvcApplication2.zip"
      $destination = "C:\\MvcApplication2.zip"
      Invoke-WebRequest $source -OutFile $destination
    }
    TestScript={
      $false
        }
  }
  EOH
end

directory "C:\\inetpub\\wwwroot" do
  action :delete
  recursive true
end

directory "C:\\inetpub\\wwwroot"

dsc_script 'Extract-Artifacts' do
  code <<-EOH
  Archive Artifact {
      Ensure = "Present"
      Path = "C:\\MvcApplication2.zip"
      Destination = "C:\\inetpub\\wwwroot\\"
  }
  EOH
end
