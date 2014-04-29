class Poll < ActiveRecord::Base
  has_many :options
  has_many :votes
  belongs_to :user
  validates :options, :name, presence: true
  validates :multiple_options, inclusion: { in: [true, false] }

  def results
    total_votes = self.votes.count
    self.options.each_with_object([]) do |option, arr|
      arr.push({name: option.name,
                votes: option.total_votes,
                percentage: percentage(option.total_votes, total_votes)})
    end
  end

  private

  def percentage(count, total_count)
    total_count != 0 ? ((count.to_f/total_count.to_f)*100.0).round(2) : 0
  end

end
