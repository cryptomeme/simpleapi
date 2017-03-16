ENV["RACK_ENV"] = "test"

require_relative "../simplestats"

require "rspec"
require "rack/test"

describe "The Simple Stats API" do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	context "Calling utility endpoints" do
		it "gives a PONG from the /ping endpoint" do
			get "/ping"
			expect(last_response).to be_ok
			expect(last_response.body).to eq("PONG")
		end

		it "gives version 1" do
			get "/version"
			expect(last_response).to be_ok
			expect(last_response.body).to eq("1")
		end
	end

	context "Endpoints exist" do
		it "gives an OK getting CPU info" do
			get "/cpuinfo"
			expect(last_response).to be_ok
		end

		it "gives an OK getting Memory info" do
			get "/meminfo"
			expect(last_response).to be_ok
		end

		it "gives an OK getting Uptime info" do
			get "/uptime"
			expect(last_response).to be_ok
		end
	end
end