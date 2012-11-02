require File.dirname(__FILE__) + "/spec_helper"

describe "App" do
	include Rack::Test::Methods

	def app
		@app ||= Sinatra::Application
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
				post "/users/",{:uuid  => "33"}
			end
			it "should exist user in Mongoid" do
				user = User.find_by(:uuid => "33")
				user.uuid.should match(/33/)
			end
		end
	end


# post "/users/:uuid/" do
# 	user = User.find_or_create_by(:uuid => params[:uuid])
# 	puts user
# 	puts params[:price]
# end
	describe "create drinks" do
		before "get current user" do
			post "/users/",{:uuid => "33"}
		end

		it "should create drinks" do
			user = User.find_by(:uuid => "33")
		end
	end


end
