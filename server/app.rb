require "rubygems"
require "pry"
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
	return user
end


get "/users/:uuid/drinks/total_price/" do
	content_type :json
	user = User.find_by(:uuid => params[:uuid])
	return {:total => user.total_price}.to_json
end

get "/users/:uuid/rank/" do
	content_type :json
	uuid = params[:uuid]
	return {:rank => User.current_rank(uuid),:total => User.all.count}.to_json
end


post "/users/:uuid/drinks/" do
	price = params[:price].to_f
	type = params[:type].downcase.split(" ").join("_")
	user = User.find_or_create_by(:uuid => params[:uuid])
	user.drinks.create({:type => type,:price => price})
end





