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

	describe "success response" do
		describe "/" do
			before do
				get "/"
			end
			it "success /" do
				last_response.should be_ok
			end
		end
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
		end

		it "should create drinks" do
			current_user.drinks.first.type.should == "drip_coffee"
		end
		after(:all) do
			current_user.drinks.delete_all
			current_user.drinks.count.should == 0
		end
	end


end
