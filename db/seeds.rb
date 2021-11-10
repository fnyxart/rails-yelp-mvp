puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
100.times do
  restaurant = Restaurant.create!(
    name: Faker::Books::Dune.planet,
    address: Faker::Books::Dune.planet,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w(chinese italian japanese french belgian).sample,
    chef_name: "#{Faker::Books::Dune.title} #{Faker::Books::Dune.character}"
  )
  puts "Creating restaurant with id #{restaurant.id}"
end

puts "Finished!"
