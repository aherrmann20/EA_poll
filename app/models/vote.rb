class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote_option
  # counter_culture :vote_option
end
