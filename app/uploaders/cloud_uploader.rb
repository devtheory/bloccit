class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :tiny do
    process resize_to_fill: [20,30]
  end

  version :small do
    process resize_to_fill: [20,30]
  end

  version :profile do
    process resize_to_fill: [45,45]
  end

end