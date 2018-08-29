class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_url, uniqueness: true

	# has_and_belongs_to_many :carts

	has_many :stores
	has_many :carts, through: :stores
end
