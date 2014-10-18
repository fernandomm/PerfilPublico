class PoliticalParty < ActiveRecord::Base
  has_many :candidates
  validates_presence_of :name

  mount_uploader :image, PartyImageUploader
end
