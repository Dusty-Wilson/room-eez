
require 'faker'

def rand_date
  # return a random date within 100 days of today in both past and future directions.
  n = rand(-100..100)
  Date.today.advance(days: n)
end

# firsts = %w[Sasha Steve Sammy Monica Ariel Casey Jared Dusty Jaimin Daniel].create!(:user => first_name)
# firsts.each do |i|
# %w[Grodzins Yim Rihawi Cho Diamond Cumbow Daughtery Wilson Patel Deutsch].create!(:user => last_name)


10.times do |i|
	user = User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email,
		password: "password",
		phone_number: "(123)123-1234")

	bill = Bill.create!(
		name: Faker::Address.country,
		description: Faker::Lorem.sentence(3),
		creator_id: user.id,
		cost: rand()
	)

	bill_participation = BillParticipation.create!(
		user_id: User.all.sample.id,
		bill_id: bill.id,
		iou: nil
	)

	chore = Chore.create!(
		name: Faker::Commerce.color,
		description: Faker::Lorem.sentence(3),
		happen_at: rand_date,
		creator_id: user.id
	)

	chore_participation = ChoreParticipation.create!(
		chore_id: chore.id,
		user_id: User.all.sample.id
	)

	event = Event.create!(
		name: Faker::Commerce.department,
		description: Faker::Lorem.sentence(3),
		happen_at: rand_date,
		creator_id: user.id
	)

	participants = User.all.sample(rand(1..User.all.length))
	participants.each do |participant|
		EventParticipation.create!(
			user_id: participant.id,
			event_id: event.id
		)
	end


end

