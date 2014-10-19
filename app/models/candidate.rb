class Candidate < ActiveRecord::Base
  self.per_page = 10
  belongs_to :political_party
  has_many :promises

  validates_presence_of :name, :biography, :age
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }
  validates :political_office, inclusion: {in: :political_office_enum}

  mount_uploader :image, CandidateImageUploader

  def state_list
    [["Acre", "ac"],
    ["Alagoas", "al"],
    ["Amapá", "ap"],
    ["Amazonas", "am"],
    ["Bahia", "ba"],
    ["Ceará", "ce"],
    ["Distrito Federal", "df"],
    ["Espírito Santo", "es"],
    ["Goiás", "go"],
    ["Maranhão", "ma"],
    ["Mato Grosso", "mt"],
    ["Mato Grosso do Sul", "ms"],
    ["Minas Gerais", "mg"],
    ["Pará", "pa"],
    ["Paraíba", "pb"],
    ["Paraná", "pr"],
    ["Pernambuco", "pe"],
    ["Piauí", "pi"],
    ["Rio de Janeiro", "rj"],
    ["Rio Grande do Norte", "rn"],
    ["Rio Grande do Sul", "rs"],
    ["Rondônia", "ro"],
    ["Roraima", "rr"],
    ["Santa Catarina", "sc"],
    ["São Paulo", "sp"],
    ["Sergipe", "se"],
    ["Tocantins", "to"]]
  end

  def political_office_enum
    # [["Mayor","mayor"],
    #  ["City Councilman","city_councilman"],
    #  ["State Representative","state_representative"],
    #  ["Governor","governor"],
    #  ["Congressman","congressman"],
    #  ["Senator","senator"],
    #  ["President","president"]]
    ['mayor', 'city_councilman', 'state_representative', 'governor', 'congressman', 'senator', 'president']
  end

  def self.search(search, page = 1)
    where("unaccent(name) ilike unaccent(?)", "%#{search}%")
      .order(name: :asc)
      .page(page)
  end
end
