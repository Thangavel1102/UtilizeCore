# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['Speed Post', 'Regular'].each do |name|
	ServiceType.create(name: name)
end


['sender', 'receiver'].each do |name|
	user = User.new(name: name, email: "#{name}@gmail.com")
	user.build_address(address_line_one: "Test Street #{name}", city: "New Delhi",
		               state: "New Delhi", country: "India", pincode: 110111,
		               mobile_number: '9999999999')
	user.save
end

user_types = %w[admin user]
user_types.each do |u|
  user = User.create(email: "velthangavelcse+#{u}@gmail.com", name: "Thangavel-#{u}", password: "rails@123", password_confirmation: "rails@123", user_type: "#{u}")
  user.build_address(address_line_one: "1st street", address_line_two: "Nehru nagar", city: "Erode", state: "Tamil Nadu", country: "India", pincode: "638002", mobile_number: "9930987678")
  user.save
end

