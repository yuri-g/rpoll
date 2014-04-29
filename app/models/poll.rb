class Poll < ActiveRecord::Base
  has_many :options
  has_many :votes
  belongs_to :user
  validates :options, :name, presence: true
  validates :multiple_options, inclusion: { in: [true, false] }
  accepts_nested_attributes_for :options

  def results
    total_votes = self.votes.count
    self.options.each_with_object([]) do |option, arr|
      arr.push(name: option.name,
               votes: option.vote_count,
               percentage: percentage(option.vote_count, total_votes))
    end
  end

  private

  def percentage(count, total_count)
    total_count != 0 ? ((count.to_f / total_count.to_f) * 100.0).round(2) : 0
  end
end
