require 'mailjet'

class UserMailer < ApplicationMailer

  def contact
    Mailjet.configure do |config|
      config.api_key = '3c6830e7960ed7aa8e590777da567b5b'
      config.secret_key = 'd289d0234577fba0373903cd457bb254'
      config.default_from = 'remi50avj.c@live.fr'
      config.api_version = "v3.1"
    end
  #@user = user
  variable = Mailjet::Send.create(messages: [{
      'From'=> {
          'Email'=> 'remi50avJ.C@live.fr',
          'Name'=> 'ChatonPix'
      },
      'To'=> [
          {
              'Email'=> 'remi.boivin@epitech.eu',
              'Name'=> 'User'
          }
      ],
      'Subject'=> 'commande!',
      'TextPart'=> 'yes une commande !',
      'HTMLPart'=> '<h3>Admin</h3><br />Yess une commande !'
  }]
  )
p variable.attributes['Messages']

end

def contact_admin(user)
  Mailjet.configure do |config|
    config.api_key = '3c6830e7960ed7aa8e590777da567b5b'
    config.secret_key = 'd289d0234577fba0373903cd457bb254'
    config.default_from = 'remi50avj.c@live.fr'
    config.api_version = "v3.1"
  end
@user = user
variable = Mailjet::Send.create(messages: [{
    'From'=> {
        'Email'=> 'remi50avJ.C@live.fr',
        'Name'=> 'ChatonPix'
    },
    'To'=> [
        {
            'Email'=> @user.email,
            'Name'=> 'Admin'
        }
    ],
    'Subject'=> 'commande!',
    'TextPart'=> 'yes une commande !',
    'HTMLPart'=> '<h3>Admin</h3><br />Yess une commande !'
}]
)
p variable.attributes['Messages']

end

  end
