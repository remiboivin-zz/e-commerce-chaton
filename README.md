# README

## Notre site :
https://chatonpix.herokuapp.com/

<p style="text-align:center;"><img src = "https://i.imgur.com/3wld7Pp.gif" style = "center" ></img>

## Les fonctionalités
(décrire brièvement ce qu'il est possible de faire/voir)

- Photos de chats 
(vue index et détail par image + ajout au panier)

- L'utilisateur devra s'inscrire pour faire un achat
  
- Accès au dashboard (pour les administrateurs)
  Identifiants pour tester l'affichage dans le profil :
email : jojo@jojo.fr
mot de passe : jeteste

- Panier 
  Possibilité de supprimer un article

- Passer une commande
  
- Envoi d'email

- Paiement en ligne

## Model Base de donnée Card - Item -> Intransitive Associations
> https://www.sitepoint.com/master-many-to-many-associations-with-activerecord/

## Visualiser le site en local
bundle install --without production
rails db:migrate
rails db:seed
ajouter les crédentials de test Stripe dans le fichier .bash_profile (https://stripe.com/docs/checkout/rails)
rails s

## L'équipe
...
