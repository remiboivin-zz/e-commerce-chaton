# README

## Notre site :
https://chatonpix.herokuapp.com/

<p style="text-align:center;"><img src = "https://i.imgur.com/3wld7Pp.gif" style = "center" ></img>

## Les fonctionalités

<img src = "https://image.ibb.co/kQjPYU/Capture_d_e_cran_2018_08_27_a_14_23_07.png"></img>
- Photos de chats 
(vue index et détail par image + ajout au panier)

- L'utilisateur devra s'inscrire pour faire un achat
  
- Accès au dashboard (pour les administrateurs)
  Identifiants pour tester l'affichage dans le profil :
  
    - email : jojo@jojo.fr
    - mot de passe : jeteste

- Panier 
   - Possibilité de supprimer un article

- Passer une commande
  
- Envoi d'email de confirmation

- Paiement en ligne avec Stripe

## Model Base de donnée Card - Item -> Intransitive Associations
> https://www.sitepoint.com/master-many-to-many-associations-with-activerecord/

## Visualiser le site en local
```sh
$ bundle install --without production
$ rails db:migrate
$ rails db:seed
$ ajouter les crédentials de test Stripe dans le fichier .bash_profile (https://stripe.com/docs/checkout/rails)
$ rails s
```

## L'équipe
...
