class Option < ActiveRecord::Base
  belongs_to :poll
  validates_presence_of :name
end
