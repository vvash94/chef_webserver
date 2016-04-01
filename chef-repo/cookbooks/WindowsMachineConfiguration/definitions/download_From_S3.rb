define :download_From_S3, :accessKey => :nil, :secretKey => :nil, :region => :nil, :fileName => :nil, :bucketName => :nil, :filePath => :nil, :savingPath => :nil, :unZipPath => :nil do

  dsc_script 'DownloadFromS3' do
    code <<-EOH
        Script Download {
                GetScript = {
                  $res= "#{params[:savingPath]}"
                  $res
                }
                SetScript = {
                     Copy-S3Object -BucketName '#{params[:bucketName]}' -Key '#{params[:fileName]}' -LocalFile '#{params[:filePath]}' -AccessKey '#{params[:accessKey]}' -SecretKey '#{params[:secretKey]}' -Region '#{params[:region]}'
                }
                TestScript = {
                    Test-Path "#{params[:filePath]}"
                }
            }
    EOH
  end
  #Unzip Download
  if params[:unZipPath]
    dsc_script 'Unzip' do
      code <<-EOH
        Archive Download {
          Ensure = "Present"
          Path = "#{params[:filePath]}"
          Destination = "#{params[:unZipPath]}"
        }
      EOH
    end
  end
end
