class Candidate < ActiveRecord::Base
  belongs_to :political_party
  has_many :promises

  validates_presence_of :name, :biography, :age
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }
  validates :political_office, inclusion: {in: :political_office_enum}

  mount_uploader :image, CandidateImageUploader

  def political_office_enum
    ['mayor', 'city_councilman', 'state_representative', 'governor', 'congressman', 'senator', 'president']
  end

  def self.search(search)
    where("name ilike ?", "%#{search}%")
  end
end
