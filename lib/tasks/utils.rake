namespace :utils do
  desc "Creating Users"
  task seed: :environment do

  	10.times do |i|
  		User.create!(
  			nome: Faker::Name.name,
  			birthdate: Faker::Date.between_except(20.year.ago, 1.year.from_now, Date.today),
  			cpf: Faker::CPF.pretty,
  			descricao: Faker::Lorem.paragraph(2),
  			active: false,
  			position: User.positions.sample,
  			cell_phone: Faker::PhoneNumber.cell_phone,
  			home_phone: Faker::PhoneNumber.phone_number,
  			email: Faker::Internet.safe_email,
        password: "12345678",
        password_confirmation: "12345678"
			)

  	end
  end
end
