class VoteOption < ActiveRecord::Base
# Sets up associations between vote_option and poll, as well as vote_option and votes and vote_option and users
  belongs_to :poll
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  validates :title, presence: true
end
