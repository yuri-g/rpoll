class Poll < ActiveRecord::Base
  has_many :options
  belongs_to :user
  validates :options, :name, :multiple_options, presence: true
end
