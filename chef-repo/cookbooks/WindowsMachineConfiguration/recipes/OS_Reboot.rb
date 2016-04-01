#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: OS_Reboot
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

reboot 'RebootRequest' do
  action :nothing
  reason 'Need to reboot when the run completes successfully.'
  delay_mins 1
end
