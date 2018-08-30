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
            'Name'=> 'Mailjet Pilot'
        },
        'To'=> [
            {
                'Email'=> 'remi.boivin@epitech.eu',
                'Name'=> 'test'
            }
        ],
        'Subject'=> 'Your email flight plan!',
        'TextPart'=> 'Dear , welcome to Mailjet! May the delivery force be with you!',
        'HTMLPart'=> '<h3>Dear, welcome to Mailjet!</h3><br />May the delivery force be with you!'
    }]
    )
  p variable.attributes['Messages']

  end
  end
