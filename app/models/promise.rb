class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :category

  validates_presence_of :title, :description, :candidate_id, :category_id, :status, :date
  validates :status, inclusion: {in: :status_enum, allow_nil: true}

  scope :visible, -> { where(visible: true) }

  def status_enum
    ['accomplished', 'in_progress', 'not_accomplished']
  end
end
