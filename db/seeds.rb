nb_de_user = 10
nb_d_item = 5
nb_de_cart = 0
cart_a_remplir = 3

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


# ---------------------------------------------------
# => ----        REMPLISSAGE DES CARTS 3 & 5
# ---------------------------------------------------


puts "---- REMPLISSAGE DU CART #{cart_a_remplir} ----"
4.times do
  x = rand(1..Item.last.id)
  begin
    puts "on tente ca"
    Cart.find(cart_a_remplir).items << Item.find(x)
    puts "Ajout de l'item N°#{x} dans le Cart N°#{cart_a_remplir}"
  rescue Exception => e
    puts "error :)\n Le cart #{cart_a_remplir} n'existe pas!!!"
    break
  end
end
puts "---- AFFICHAGE DU CART #{cart_a_remplir} ----"
begin
  Cart.find(cart_a_remplir).items.each do |item|
    puts "#{item.title} -> #{item.price}$"
  end
rescue Exception => e
  puts "Le Cart n'existe pas :)"
end


cart_a_remplir = 5
puts "---- REMPLISSAGE DU CART #{cart_a_remplir} ----"
2.times do
  x = rand(1..Item.last.id)
  begin
    puts "on tente ca"
    Cart.find(cart_a_remplir).items << Item.find(x)
    puts "Ajout de l'item N°#{x} dans le Cart N°#{cart_a_remplir}"
  rescue Exception => e
    puts "error :)\n Le cart #{cart_a_remplir} n'existe pas!!!"
    break
  end
end
puts "---- AFFICHAGE DU CART #{cart_a_remplir} ----"
begin
  Cart.find(cart_a_remplir).items.each do |item|
    puts "#{item.title} -> #{item.price}$"
  end
rescue Exception => e
  puts "Le Cart n'existe pas :)"
end
