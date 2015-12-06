class User < ActiveRecord::Base
	# Sets up assocations between user and votes, as well as user and vote_options
	has_many :votes, dependent: :destroy
	has_many :vote_options, through: :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Devise gem sets up most of user authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy

  # Method to determine whether or not user has cast vote on a given poll, as used by the votes_controller to ensure user
  # does not vote multiple times for same poll.
  def voted_for?(poll)
  	vote_options.any? {|v| v.poll == poll}
  end
end
