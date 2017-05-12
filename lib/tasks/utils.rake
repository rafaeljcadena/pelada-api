namespace :utils do
  desc "Creating Players"
  task seed: :environment do

  	10.times do |i|
  		Player.create!(
  			nome: Faker::Name.name,
  			birthdate: Faker::Date.between_except(20.year.ago, 1.year.from_now, Date.today),
  			cpf: Faker::CPF.pretty,
  			descricao: Faker::Lorem.paragraph(2),
  			active: false,
  			position: Player.positions.sample,
  			cell_phone: Faker::PhoneNumber.cell_phone,
  			home_phone: Faker::PhoneNumber.phone_number,
  			email: Faker::Internet.safe_email
			)

  	end
  end
end
