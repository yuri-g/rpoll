class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  belongs_to :option
end
