class Drink
	include Mongoid::Document
	belongs_to :user
	field :price
	field :type
end
