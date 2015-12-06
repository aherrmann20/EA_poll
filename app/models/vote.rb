class Vote < ActiveRecord::Base
  # Sets up associations between vote and user and vote and vote_option
  belongs_to :user
  belongs_to :vote_option
  # counter_culture :vote_option
end
