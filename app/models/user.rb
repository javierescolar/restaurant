class User < ApplicationRecord
  belongs_to :profile
  has_many :orders

  before_save :encryptPassword


  validates :dni,:profile_id,:name,:surnames,:mail,:password,:presence => true
  validates :dni,:mail, :uniqueness => true
  validates :name,:surnames, :length => {:minimum =>3}
  validates :phone_1,:phone_2, :length => {:is =>9}, :numericality => {:only_integer =>true}, :allow_nil => true
  validates :dni, :format => {:with => /[0-9]{8}[A-Z]{1}/}

  def checkDependences
    return self.orders.count == 0
  end

  def encryptPassword
    if (self.password_changed?)
      self.password = Digest::MD5.hexdigest(self.password)
    end
  end

  def whatIsMyProfile
    return self.profile_id
  end
end
