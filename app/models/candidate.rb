class Candidate < ActiveRecord::Base
  belongs_to :party
  
  validates_presence_of :name, :biography, :age
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }

  mount_uploader :image, CandidateImageUploader
end
