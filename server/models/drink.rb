class Drink
	include Mongoid::Document
	belongs_to :user, :dependent => :destroy
	before_destroy :send_destroy_message

	field :price , :type => Float
	field :type



	def send_destroy_message
		puts "destroy message"
	end

end

