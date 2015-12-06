class VotesController < ApplicationController

  # each vote is created and is linked to current_user, the poll, and the specific vote_option selected by the user.
  # The poll on which is voted is found by the id, as is the option. A measure is in place to ensure that if a user has 
  # already cast a vote on the event, they may not cast another. If they attempt to (which can happen before the page
  # is refreshed and the vote button disappears on the view), a JS alert will pop up

  # This method, along with many others, is from the tutorial found at http://www.sitepoint.com/polling-users-rails/
  def create
    if current_user && params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @option = @poll.vote_options.find_by_id(params[:vote_option][:id])
      if @option && @poll && !current_user.voted_for?(@poll) && (@poll.open?)
        @option.votes.create({user_id: current_user.id})
      else
        render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
      end
    else
      render js: 'alert(\'Your vote cannot be saved.\');'
    end
  end
end