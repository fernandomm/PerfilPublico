class Candidate < ActiveRecord::Base
  belongs_to :political_party
  has_many :promises

  validates_presence_of :name, :biography, :age
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }
  validates :political_office, inclusion: {in: :political_office_enum}
  validates :state, inclusion: {in: :state_enum, :allow_nil => true}

  mount_uploader :image, CandidateImageUploader

  scope :per_state, lambda { |state| where(:state => state).where('political_office != ?', :president).order(:political_office) }

  def state_enum
    ["ac",
    "al",
    "ap",
    "am",
    "ba",
    "ce",
    "df",
    "es",
    "go",
    "ma",
    "mt",
    "ms",
    "mg",
    "pa",
    "pb",
    "pr",
    "pe",
    "pi",
    "rj",
    "rn",
    "rs",
    "ro",
    "rr",
    "sc",
    "sp",
    "se",
    "to"]
  end

  def political_office_enum
    ['mayor', 'city_councilman', 'state_representative', 'governor', 'congressman', 'senator', 'president']
  end

  def self.search(search, page = 1)
    where("unaccent(name) ilike unaccent(?)", "%#{search}%")
      .order(name: :asc)
      .page(page)
  end
end
