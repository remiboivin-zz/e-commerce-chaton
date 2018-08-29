nb_de_user = 3
nb_d_item = 4
nb_de_cart = 5
num_cart_a_remplir = 4


require 'faker'

nb_d_item.times do |i|
  Item.create(
    title: Faker::Cat.name,
    description: Faker::Movie.quote,
    price: Faker::Number.decimal(2),
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


nb_de_cart.times do |i|

  mon_cart = Cart.new(
    user_id: rand(1..nb_de_user)
  )
  if mon_cart.save
    puts "\nCréation du Cart N°#{i}.____"
  else
    puts "\t----- Attention ! Un PANIER (Cart) existe déjà pour cet User. -----\n"
    # puts"\tUn User ne peut posséder qu'un seul Cart [...]\n\tCela signifie que si l'User possède déjà un panier, le panier que vous avez voulu créer ne sera pas créer (car un Cart existe déjà pour cet User) -----"
  end
end
puts


# # ---------------------------------------------------
# # => ----        REMPLISSAGE DU CART CHOISI
# # ---------------------------------------------------

puts
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
