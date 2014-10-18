class Promise < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :category
end
