#
# Cookbook Name:: WindowsMachineConfiguration
# Recipe:: firewallRules
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node["OS_Configure"]["firewallRules"].each do |firewall|
  dsc_script 'Add New Firewall Rule' do
    code <<-EOH
      Script addNewFirewallRule
      {
        GetScript={
            Get-NetFirewallRule -DisplayName "#{firewall['firewallName']}"
        }
        SetScript={
          if("#{firewall['protocol']}" -eq "tcp" -or "#{firewall['protocol']}" -eq "udp")
            {
                netsh advfirewall firewall add rule name="#{firewall['firewallName']}" protocol='#{firewall['protocol']}' dir='#{firewall['direction']}' action='#{firewall['action']}' profile='#{firewall['profile']}' localport='#{firewall['localport']}' program='#{firewall['program']}' remoteip='#{firewall['remoteip']}'
            }
          else
            {
                netsh advfirewall firewall add rule name="#{firewall['firewallName']}" protocol='#{firewall['protocol']}' dir='#{firewall['direction']}' action='#{firewall['action']}' profile='#{firewall['profile']}' program='#{firewall['program']}' remoteip='#{firewall['remoteip']}'
            }
        }
        TestScript={
              $fw=Get-NetFirewallRule | ? { $_.DisplayName -eq "#{firewall['firewallName']}"}
              $fw -ne $null
        }
      }
      Script checkFirewallRule
      {
        GetScript={
            Get-NetFirewallRule -DisplayName "#{firewall['firewallName']}"
        }
        SetScript={
              Set-NetFirewallRule -DisplayName "#{firewall['firewallName']}" -Profile "#{firewall['profile']}" -Direction "#{firewall['direction']}" -Protocol "#{firewall['protocol']}" -Action "#{firewall['action']}" -LocalPort "#{firewall['localport']}" -RemoteAddress "#{firewall['remoteip']}" -Program "#{firewall['program']}"
        }
        TestScript={

            $obj = Get-NetFirewallRule | ? { $_.DisplayName -eq "#{firewall['firewallName']}" -and $_.Action -eq "#{firewall['action']}" -and $_.Profile -eq "#{firewall['profile']}"} | Get-NetFirewallApplicationFilter | ? {$_.Program -eq "#{firewall['program']}"} | Get-NetFirewallRule | Get-NetFirewallPortFilter | ? { $_.LocalPort -eq "#{firewall['localport']}"} | Get-NetFirewallRule | Get-NetFirewallAddressFilter | ? {$_.RemoteAddress -eq "#{firewall['remoteip']}"} |Get-NetFirewallRule
            $obj -ne $null
        }
      }
    EOH
  end
end
