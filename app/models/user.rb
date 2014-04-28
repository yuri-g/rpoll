class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email, :username, :password

  has_many :votes
  has_many :polls
  def vote(options, poll)
    options.each do |o|
      Vote.create(option_id: o, poll_id: poll, user_id: self.id)
    end
  end
end
