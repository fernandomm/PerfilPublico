class Category < ActiveRecord::Base
  validates_presence_of :name

  mount_uploader :image, CategoryImageUploader
end
