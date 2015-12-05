class AddCorrectToVoteOptions < ActiveRecord::Migration
  def change
  	add_column :vote_options, :correct, :boolean, default: false
  end
end
