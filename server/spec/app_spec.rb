require File.dirname(__FILE__) + "/spec_helper"
UUID = 33.to_s






describe "App" do
	include Rack::Test::Methods

	def app
		@app ||= Sinatra::Application
	end

	def current_user
		return User.find_by(:uuid => UUID)
	end


	describe "create users" do
		describe "create via uuid" do
			before "post /users" do
				post "/users/",{:uuid  => UUID}
			end
			it "should exist user in Mongoid" do
				current_user.uuid.should match(/33/)
			end
		end
	end


	describe "create drinks" do
		before "get current user" do

			post "/users/#{current_user.uuid}/drinks/" ,{:type => "drip_coffee",:price => 3.0}

			#create user10
			post "/users/",{:uuid => 10}
			post "/users/10/drinks/" ,{:type => "cafe_late",:price => 3.5}

			# create user11
			post "/users/",{:uuid => 11}
			post "/users/11/drinks/",{:type => "cafe_late",:price => 4}
			post "/users/11/drinks/",{:type => "cafe_late",:price => 3.5}

		end

		it "should create drinks" do
			current_user.drinks.first.type.should == "drip_coffee"
		end


		it "should create another user" do

			another_user = User.find_by({:uuid => "10"})
			another_user.uuid.should == "10"

		end



	end


	describe "ranking" do


		it "should ranking work correctly working" do
			users = User.all
			res = []
			# users.sort_by!{|user| user.total_price.to_f}
			users.map{|user| res.push user.drinks.map{|drink| drink.price}}
			p res
		end




	end


		after(:all) do
				users = User.all
				User.delete_all
				Drink.delete_all
				User.count.should == 0
		end
end





