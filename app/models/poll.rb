class Poll < ActiveRecord::Base
  has_many :options
  validates_presence_of :options, :name
end
