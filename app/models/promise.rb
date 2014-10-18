class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :category

  validates_presence_of :title, :description, :candidate_id, :category_id, :status
  validates :status, inclusion: {in: :status_enum, allow_nil: true}

  def status_enum
    ['accomplished', 'in_progress', 'not_accomplished']
  end
end
