class User < ActiveRecord::Base
	has_many :votes, dependent: :destroy
	has_many :vote_options, through: :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy

  def voted_for?(poll)
  	vote_options.any? {|v| v.poll == poll}
  end
end
