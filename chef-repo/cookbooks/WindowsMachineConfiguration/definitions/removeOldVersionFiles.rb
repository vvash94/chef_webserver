define :removeOldVersion, :filePath => :nil, :fileName => :nil, :folderName => :nil, :savingPath => :nil do
  dsc_script 'Is New Version' do
    code <<-EOH
        Script isNewVersion{
          GetScript={
                $res
          }
          SetScript={
                  $temp = "#{params[:fileName]}"
                  $temp = $temp.Substring(0,4)
                  Remove-Item "#{params[:savingPath]}$temp*" -Force
                  if(#{params[:folderName]})
                    {
                        Remove-Item "#{params[:folderName]}" -Recurse -Force
                    }
          }
          TestScript={
            $res= (Test-Path "#{params[:filePath]}")
            !$res
          }
        }
    EOH
  end
end
