class Cart < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :items

	validates :user_id, uniqueness: true

	has_many :stores
	has_many :carts, through: :stores
end
