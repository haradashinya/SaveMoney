class User
	include Mongoid::Document

	field :uuid
	has_many :drinks


	def total_price
		sum = 0
		self.drinks.map{|drink| sum += drink.price.to_f}
		sum =  '%.4g' % sum
		return sum
	end
end
