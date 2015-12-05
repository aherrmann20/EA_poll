# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating admin..."

admin = User.create! email: "admin@example.com", password: "password", password_confirmation: "password", admin: true

puts "Creating user..."

user = User.create! email: "email@email.com", password: "password", password_confirmation: "password"

Poll.create! topic: "Will we succeed in our quest to do well in CS50?" do |poll|
	poll.vote_options << VoteOption.find_or_create_by!(title: "Yes")
	poll.vote_options << VoteOption.find_or_create_by!(title: "No (cries)")
	poll.vote_options << VoteOption.find_or_create_by!(title: "HELL YES")
end

Poll.create! topic: "Is David Malan a badass?" do |poll|
	poll.vote_options << VoteOption.find_or_create_by!(title: "Yes")
	poll.vote_options << VoteOption.find_or_create_by!(title: "Maybe")
	poll.vote_options << VoteOption.find_or_create_by!(title: "Of course")
end

Poll.create! topic: "Does Diet Coke cause cancer?" do |poll|
	poll.vote_options << VoteOption.find_or_create_by!(title: "Probably")
	poll.vote_options << VoteOption.find_or_create_by!(title: "I'm pretty sure it does")
	poll.vote_options << VoteOption.find_or_create_by!(title: "I'm gonna drink it anyway")
end