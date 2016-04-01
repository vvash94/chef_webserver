#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'WindowsMachineConfiguration::firewallRules'
#include_recipe 'WindowsMachineConfiguration::APP_Antivirus'
include_recipe 'WindowsMachineConfiguration::OS_WindowsFeatures'
include_recipe 'WindowsMachineConfiguration::IIS_WebSite'
include_recipe 'WindowsMachineConfiguration::OS_Configure'
include_recipe 'WindowsMachineConfiguration::OS_Reboot'
