class Option < ActiveRecord::Base
  belongs_to :poll
  has_many :votes
  validates :name, presence: true

  def total_votes
    self.votes.count
  end

end
