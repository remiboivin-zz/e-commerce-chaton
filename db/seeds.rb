nb_de_user = 5
nb_d_item = 6
nb_de_card = 3

require 'faker'

nb_d_item.times do |i|
  Item.create(
    title: Faker::Cat.name,
    description: Faker::Cat.breed,
    price: Faker::Stripe.ccv,
    image_url: "chaton#{i}.jpg"
  )
  puts "Création de l'Item N°#{i}."
end
puts

nb_de_user.times do |i|
	User.create(
		email: Faker::Internet.email,
		password: 'test_that'
	)
  puts "Création de l'User N°#{i}."
end
puts

nb_de_card.times do |i|

	mon_card = Card.new(
		user_id: rand(1..nb_de_user)
	)
  if mon_card.save
    puts "Création du Card N°#{i}."
  end
end
puts "\t----- Attention ! Un User ne peut posséder qu'un seul Card [...]\n\tCela signifie que si l'User possède déjà un panier, le panier que vous avez voulu créer ne sera pas créer (car un Card existe déjà pour cet User) -----"
puts