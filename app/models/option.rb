class Option < ActiveRecord::Base
  belongs_to :poll
  has_many :votes
  validates :name, presence: true

  def vote_count
    self.votes.count
  end

end
