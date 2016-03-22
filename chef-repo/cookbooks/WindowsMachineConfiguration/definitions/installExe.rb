define :installExe, :filePath => :nil, :installerName => :nil do
  dsc_script 'Install exe' do
    code <<-EOH
    Script Installexe{
      GetScript={ $true }
      SetScript={
            Start-Process "#{params[:filePath]}" -ArgumentList "/S"
      }
      TestScript={
          $res = Get-WmiObject -Class win32_product | ? {$_.Name -match "#{params[:installerName]}"}
          if($res -and $true)
          {
                $version = $res.Version
                $res = $version -eq ([System.Diagnostics.FileVersionInfo]::GetVersionInfo("#{params[:filePath]}").ProductVersion)
          }
          $res -and $true
      }
    }
    EOH
  end
end
