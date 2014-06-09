
require 'faker'

def rand_date
  # return a random date within 100 days of today in both past and future directions.
  n = rand(-100..100)
  Date.today.advance(days: n)
end

firsts = %w(Sasha Steve Sammy Monica Ariel Casey Jared Dusty Jaimin Daniel Gustavo Parth Tom Ben)
lasts = %w(Grodzins Yim Rihawi Cho Diamond Cumbow Daughtery Wilson Patel Deutsch Puglia Naik Nullet Golden)



until lasts.empty?
	first_name = firsts.pop
	user = User.create!(
		first_name: first_name,
		last_name: lasts.pop,
		email: "#{first_name}@farts.com",
		password: "password",
		phone_number: "(123)123-1234")
end

	# bill = Bill.create!(
	# 	name: Faker::Address.country,
	# 	description: Faker::Lorem.sentence(3),
	# 	creator_id: user.id,
	# 	cost: rand()
	# )

	# bill_participation = BillParticipation.create!(
	# 	user_id: User.all.sample.id,
	# 	bill_id: bill.id,
	# 	iou: nil
	# )

	# chore = Chore.create!(
	# 	name: Faker::Commerce.color,
	# 	description: Faker::Lorem.sentence(3),
	# 	happen_at: rand_date,
	# 	creator_id: user.id
	# )

	# chore_participation = ChoreParticipation.create!(
	# 	chore_id: chore.id,
	# 	user_id: User.all.sample.id
	# )

	# event = Event.create!(
	# 	name: Faker::Commerce.department,
	# 	description: Faker::Lorem.sentence(3),
	# 	happen_at: rand_date,
	# 	creator_id: user.id
	# )

	# participants = User.all.sample(rand(1..User.all.length))
	# participants.each do |participant|
	# 	EventParticipation.create!(
	# 		user_id: participant.id,
	# 		event_id: event.id
	# 	)
	# end


# end

