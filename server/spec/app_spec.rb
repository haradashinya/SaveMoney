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
		before(:all) do
			User.destroy_all
		end
		describe "create via uuid" do
			before "post /users" do
				post "/users/",{:uuid  => UUID}
			end
			it "should exist user in Mongoid" do
				current_user.uuid.should match(/33/)
			end
		end
	end



	describe "Ranking" do


		before(:all) do
			post "/users/#{current_user.uuid}/drinks/" ,{:type => "drip_coffee",:price => 3.0}
			#create user10
			post "/users/",{:uuid => 10}
			post "/users/10/drinks/" ,{:type => "cafe_late",:price => 3.5}
			# create user11
			post "/users/",{:uuid => 11}
			10.times do
				post "/users/11/drinks/",{:type => "cafe_late",:price => 3.5}
			end
		end


		it "should create drinks" do
			current_user.drinks.first.type.should == "drip_coffee"
		end
		it "should calc by total_price" do
			user = User.find_by({:uuid => '11'})
			user.drinks.count.should == 10
			user.total_price.should == 35
		end

		it "should 10 drinks created correctly when post 'user/:uuid/drinks/" do
			user = User.find_by({:uuid => '11'})
			user.drinks.count.should == 10

		end

		it "should create another user" do
			another_user = User.find_by({:uuid => "10"})
			another_user.uuid.should == "10"
		end


		it "should ranking is working" do
			User.current_rank("33").should == 3
			User.current_rank("10").should == 2
			User.current_rank("11").should == 1
		end


		after(:all) do
			# User.destroy_all
		end
	end
end













