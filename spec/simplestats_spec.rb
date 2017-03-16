ENV["RACK_ENV"] = "test"

require_relative "../simplestats"

require "json"
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

	context "CPU info" do
		it "gives an OK" do
			get "/cpuinfo"
			expect(last_response).to be_ok
		end

		it "gives a valid JSON object" do
			get "/cpuinfo"
			resp = JSON.parse last_response.body
			expect(resp.is_a? Hash).to be true
		end
	end

	context "Memory info" do
		it "gives an OK" do
			get "/meminfo"
			expect(last_response).to be_ok
		end

		it "gives a valid JSON object" do
			get "/meminfo"
			resp = JSON.parse last_response.body
			expect(resp.is_a? Hash).to be true
		end
	end

	context "Uptime" do
		it "gives an OK" do
			get "/uptime"
			expect(last_response).to be_ok
		end

		it "gives a valid JSON object" do
			get "/uptime"
			resp = JSON.parse last_response.body
			expect(resp.is_a? Hash).to be true
		end
	end
end