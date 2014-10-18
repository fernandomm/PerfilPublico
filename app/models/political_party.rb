class PoliticalParty < ActiveRecord::Base
  validates_presence_of :name

  mount_uploader :image, PartyImageUploader
end
