#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: IIS_WebSite
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template 'C:\\inetpub\\wwwroot\\index.html' do
  source 'index.html.erb'
  variables({
     :ip => node['ipaddress'],
  })
end
