class Poll < ActiveRecord::Base
	# Sets up association between Poll and vote_options, a nested resource
	has_many :vote_options, dependent: :destroy
	# Poll must include a topic upon creation
	validates :topic, presence: true
	# Sets up attributes necessary for nested resource
	accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

	# normalized_votes_for to be used in helper to display voting statistics on a poll
	def normalized_votes_for(option)
		votes_summary == 0 ? 0 : (option.votes.count.to_f / votes_summary) * 100
	end

	# Another method that displays voting statistics
	def votes_summary
		vote_options.inject(0) {|summary, option| summary + option.votes.count}
	end
end
