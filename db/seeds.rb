nb_de_user = 120
nb_d_item = 200
nb_de_cart = 120
num_cart_a_remplir = 120

require 'faker'

nb_d_item.times do |i|
  Item.create(
    title: Faker::Dog.breed,
    description: Faker::Movie.quote,
    price: "#{rand(1..400)},#{rand(0..99)}",
    image_url: "chaton#{i}.jpg"
  )
  puts "Création de l'Item N°#{i}."
end

puts "--- Création de l'admin ---"
User.create(
	email: "jojo@jojo.fr",
	password: 'jeteste',
	admin: true
)

nb_de_user.times do |i|
  User.create(email: Faker::Internet.email, password: 'test_that')
  puts "Création de l'User N°#{i}."
end

nb_de_cart.times do |i|
  mon_cart = Cart.new(user_id: rand(1..nb_de_user))
  if mon_cart.save
    puts "\nCréation du Cart N°#{i}.____"
  else
    puts "\t----- Attention ! Un PANIER (Cart) existe déjà pour cet User. -----\n"
  end
end

# # ---------------------------------------------------
# # => ----        REMPLISSAGE DU CART CHOISI
# # ---------------------------------------------------

puts "---- REMPLISSAGE DU CART #{num_cart_a_remplir} ----"
6.times do
  x = rand(1..Item.last.id)
  begin
    Store.create(item_id: x, cart_id: num_cart_a_remplir)
    puts "Ajout de l'item N°#{x} dans le Cart N°#{num_cart_a_remplir}"
  rescue Exception => e
    puts "error :)\n Le cart #{num_cart_a_remplir} n'existe pas!!!"
    break
  end
end
puts "---- AFFICHAGE DU CART #{num_cart_a_remplir} ----"
begin
  Store.where(cart_id: num_cart_a_remplir).each do |i|
    print i, " -> ", i.item_id, "\n"
  end
rescue Exception => e
  puts "Le Cart n'existe pas :)"
end
