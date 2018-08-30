# README

## Notre site :
https://chatonpix.herokuapp.com/

## Les fonctionalités
(décrire brièvement ce qu'il est possible de faire/voir)

- Photos de chats 
(vue index et détail par image + ajout au panier)

- Profil utilisateur

- Accès au dashboard (pour les administrateurs)
Identifiants pour tester l'affichage dans le profil :
email : jojo@jojo.fr
mot de passe : jeteste

- Panier 

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
