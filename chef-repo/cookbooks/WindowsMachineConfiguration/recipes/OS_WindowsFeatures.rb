#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: OS_WindowsFeatures
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node["WindowsFeaturesAndRoles"]["ValuesToAdd_Array"].each do |feature|
  dsc_script 'Install FeaturesAndRoles' do
        code <<-EOH
          WindowsFeature AddFeature{
            Name = "#{feature['FeatureName']}"
            Ensure = "#{feature['EnsureValue']}"
            IncludeAllSubFeature = "#{feature['InstallAllSubFeature']}"
          }
        EOH
    end
end
