class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  validates :email, :username, :password, presence: true

  has_many :votes
  has_many :polls

  def vote!(options, poll)
    if self.voted?(poll) || (!poll.multiple_options && options.length > 1)
      false
    else
      votes_array = options.each_with_object([]) do |o, arr|
        vote = Vote.create(option: o, poll: poll, user: self)
        poll.votes << vote
        arr.push vote
      end
      votes_array
    end
  end

  def voted?(poll)
    Vote.where(poll: poll, user: self).present?
  end
end
