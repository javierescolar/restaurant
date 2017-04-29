class Plate < ApplicationRecord
  belongs_to :category
  has_many :charges
  has_many :orders, through: :charges

  has_many :dishes_products
  has_many :products, through: :dishes_products

  before_destroy :removePhoto
  before_save :savePhoto

  validates :category_id,:name,:price,:description, presence: true
  validates :photo, presence:true, :on => :create
  validates :price, :numericality  => {only_float:true}
  validates :name, :length => {:minimum =>3}
  validates :description, :length => {minimum: 10, maximum:1000}

  ROUTES_PHOTOS = "app/assets"
  DIR_PHOTOS = "images"
  @image = nil
  def validateImage(image)
    fails = 0
    if !image.nil?
      if image.original_filename.split('.').last.downcase != 'jpg'
        errors.add(:photo, "JPG format allowed")
        fails += 1
      end
      if image.size > 1.megabytes
        errors.add(:photo, "Maximum allowed size 1 MB")
        fails += 1
      end
      if fails == 0
        status = true
        @image = image
      else
        status = false
      end
    else
      errors.add(:photo, "Photo can´t be black")
      status = false
    end
    return status
  end

  def checkDependences
    return self.orders.count == 0
  end

private
  def savePhoto
    route_old_photo = self.photo_was
    if (@image.nil?)
        self.photo = route_old_photo
    else
      if !route_old_photo.nil? && File.exist?(ROUTES_PHOTOS+"/"+DIR_PHOTOS+"/"+route_old_photo)
          FileUtils.rm(ROUTES_PHOTOS+"/"+DIR_PHOTOS+"/"+route_old_photo)
      end
      name_photo = self.name.sub(' ', '')
      extension = @image.original_filename.split('.').last
      File.open(Rails.root.join(ROUTES_PHOTOS, DIR_PHOTOS, name_photo+"."+extension), 'wb') do |file|
        file.write(@image.read)
      end
      self.photo = name_photo+"."+extension
    end
    @image = nil
  end

  def removePhoto
    if File.exist?(ROUTES_PHOTOS+"/"+DIR_PHOTOS+"/"+self.photo)
        FileUtils.rm(ROUTES_PHOTOS+"/"+DIR_PHOTOS+"/"+self.photo)
    end
  end



end
