class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  process resize_to_fit: [40, 40]

  version :middle do
    process resize_to_fit: [150, 150]
  end
  
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
