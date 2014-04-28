class Poll < ActiveRecord::Base
  has_many :options
  belongs_to :user
  validates_presence_of :options, :name, :multiple_options
end
