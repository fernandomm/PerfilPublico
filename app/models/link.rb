class Link < ActiveRecord::Base
  belongs_to :promise

  validates_presence_of :url, :date
end
