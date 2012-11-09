require "rubygems"
require "pry"
require "mongoid"
require "sinatra"
require "json"
require File.join(File.dirname(__FILE__),"models","user")
require File.join(File.dirname(__FILE__),"models","drink")
require "mongo"

UUID = ""

Mongoid.configure do |config|
  config.connect_to("db_test")
end

# save uuid
class Helper
		attr_accessor :uuid

end

helper = Helper.new

get "/" do
	File.read(File.join("public","index.html"))
end




post "/users/" do
	helper.uuid = params[:uuid]
	user = User.find_or_create_by(:uuid => helper.uuid)
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

get "/users/:uuid/drinks/" do
	content_type :json
	user = User.find_by({:uuid => params[:uuid]})
	return user.drinks.to_json
end

delete "/users/:uuid/drinks/:drink_id" do
	user = User.find_by({:uuid => params[:uuid].to_i})
	drink = user.drinks.find_by({:_id => params[:drink_id]})
	drink.destroy
end




post "/users/:uuid/drinks/" do
	price = params[:price].to_f
	type = params[:type].downcase.split(" ").join("_")
	user = User.find_or_create_by(:uuid => params[:uuid])
	user.drinks.create({:type => type,:price => price})
end








