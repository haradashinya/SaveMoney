require "rubygems"
require "mongoid"
require "sinatra"
require "json"
require File.join(File.dirname(__FILE__),"models","user")
require File.join(File.dirname(__FILE__),"models","drink")
require "mongo"



Mongoid.configure do |config|
  config.connect_to("db_test")
end


get "/" do
	content_type :json
	return {:name => "nobinobiru"}.to_json
end


post "/users/" do
	user = User.find_or_create_by(:uuid => params[:uuid])
	puts user
	return user
end


post "/users/:uuid/drinks/" do
	price = params[:price].to_f
	type = params[:type].downcase.split(" ").join("_")
	user = User.find_or_create_by(:uuid => params[:uuid])
	user.drinks.create({:type => type,:price => price})

	puts user.total_price
end
