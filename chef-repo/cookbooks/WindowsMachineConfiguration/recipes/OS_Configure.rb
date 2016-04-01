#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: OS_Configure
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Edit the Admin username
dsc_script 'Change Admin Name' do
  code <<-EOH
    Script ChangeAdminName
    {
      SetScript = {
        (gwmi Win32_UserAccount | ? {$_.SID -Like 'S-1-5-*-500'}).Rename("#{node["OS_Configure"]["adminName"]}")
      }
    TestScript = {
      $uname_check = gwmi Win32_UserAccount | ? {$_.Name -Like '#{node["OS_Configure"]["adminName"]}'}
      $uname_check -and $true
    }
    GetScript = { <# This must return a hash table #> }
    }
  EOH
  notifies :request_reboot, 'reboot[RebootRequest]', :immediately
end

#Edit the Admin Password
dsc_script 'Change Admin Password' do
  code <<-EOH
    Script ChangeAdminPassword
    {
      SetScript = {
        ([adsi]"WinNT://./#{node["OS_Configure"]["adminName"]},user").SetPassword("#{node["OS_Configure"]["adminPassword"]}")
      }
    TestScript = {
      $false
    }
    GetScript = { <# This must return a hash table #> }
    }
  EOH
end

#Change time zone
dsc_script 'Change Time Zone' do
  code <<-EOH
    Script ChangeTimeZone
    {
      SetScript = {
        tzutil /s "#{node["OS_Configure"]["TimeZone"]}"
      }
    TestScript = {
      [System.TimeZone]::CurrentTimeZone.StandardName -eq "#{node["OS_Configure"]["TimeZone"]}"
    }
    GetScript = { <# This must return a hash table #> }
    }
  EOH
end
