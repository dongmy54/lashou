class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  process resize_to_fit: [500, 500]
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    '默认logo.jpeg'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
