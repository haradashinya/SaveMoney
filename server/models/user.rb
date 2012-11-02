class User
	include Mongoid::Document

	field :uuid
	has_many :drinks
end
