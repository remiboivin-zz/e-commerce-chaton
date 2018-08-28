nb_de_user = 10
nb_d_item = 5
nb_de_card = 8
card_a_remplir = 3

require 'faker'

nb_d_item.times do |i|
  Item.create(
    title: Faker::Cat.name,
    description: Faker::Movie.quote,
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
    puts "\nCréation du Card N°#{i}.____"
  else
    puts "\t----- Attention ! Un PANIER (Card) existe déjà pour cet User. -----\n"
    # puts"\tUn User ne peut posséder qu'un seul Card [...]\n\tCela signifie que si l'User possède déjà un panier, le panier que vous avez voulu créer ne sera pas créer (car un Card existe déjà pour cet User) -----"
  end
end
puts


puts "---- REMPLISSAGE DU CARD #{card_a_remplir} ----"
4.times do
  x = rand(1..Item.last.id)
  Card.find(card_a_remplir).items << Item.find(x)
  puts "Ajout de l'item N°#{x} dans le Card N°#{card_a_remplir}"
end
puts "---- AFFICHAGE DU CARD #{card_a_remplir} ----"
Card.find(card_a_remplir).items.each do |item|
  puts "#{item.title} -> #{item.price}$"
end


card_a_remplir = 5
puts "---- REMPLISSAGE DU CARD #{card_a_remplir} ----"
2.times do
  x = rand(1..Item.last.id)
  Card.find(card_a_remplir).items << Item.find(x)
  puts "Ajout de l'item N°#{x} dans le Card N°#{card_a_remplir}"
end
puts "---- AFFICHAGE DU CARD #{card_a_remplir} ----"
Card.find(card_a_remplir).items.each do |item|
  puts "#{item.title} -> #{item.price}$"
end