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

Profile.create! user: user, name: "Rick", surname: "Astley", age: "1000", photo: "http://i.ytimg.com/vi/oHg5SJYRHA0/hqdefault.jpg", 
	description: "Never gonna give you up, never gonna let you down!"


user = User.create! email: "ryanlawton@college.harvard.edu", password: "password", password_confirmation: 'password'
Profile.create! user: user, name: "Ryan", surname: "Lawton", photo: "https://scontent-lga3-1.xx.fbcdn.net/hphotos-prn2/v/t1.0-9/10625055_10203123636083140_7979122033238209072_n.jpg?oh=2c7f9b38f42921779548962854299525&oe=56E2DAE3", 
	description: "I love CS50!"

user = User.create! email: "aherrmann@college.harvard.edu", password: "password", password_confirmation: 'password'
Profile.create! user: user, name: "Annelie", surname: "Herrmann", age: "19", photo: "https://scontent-lga3-1.xx.fbcdn.net/hphotos-xtf1/v/t1.0-9/12038519_935327833221664_8783977209630045114_n.jpg?oh=e9b2a01393e8f6f4beb81e3b7e0c8576&oe=56DF98C0", 
	description: "CS50 Rocks!"

user = User.create! email: "kaanalpyay@college.harvard.edu", password: "password", password_confirmation: 'password'
Profile.create! user: user, name: "Kaan", surname: "Yay", age: "19", photo: "https://scontent-lga3-1.xx.fbcdn.net/hphotos-ash2/t31.0-8/10380119_10152458929939609_988437502338895281_o.jpg", 
	description: "Go CS50!"

Poll.create! topic: "Will we succeed in our quest to do well in CS50?" do |poll|
	poll.vote_options << VoteOption.find_or_create_by!(title: "Yes")
	poll.vote_options << VoteOption.find_or_create_by!(title: "No (cries)")
	poll.vote_options << VoteOption.find_or_create_by!(title: "You bet!")
end

Poll.create! topic: "Is David Malan a badass?" do |poll|
	poll.vote_options << VoteOption.find_or_create_by!(title: "Yes")
	poll.vote_options << VoteOption.find_or_create_by!(title: "Maybe")
	poll.vote_options << VoteOption.find_or_create_by!(title: "Of course")
end

Poll.create! topic: "Does Diet Coke cause cancer?" do |poll|
	poll.vote_options << VoteOption.find_or_create_by!(title: "Probably")
	poll.vote_options << VoteOption.find_or_create_by!(title: "I'm pretty sure it does")
	poll.vote_options << VoteOption.find_or_create_by!(title: "I'm gonna drink it anyway; caffeine is awesome.")
end