class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :category

  validates_presence_of :title, :description, :candidate_id, :category_id
end
