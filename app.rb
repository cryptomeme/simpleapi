## Implementation of the Simple API REST server endpoints

require "sinatra"


API_VERSION = "1"


get "/ping" do
	"PONG"
end

get "/version" do
	API_VERSION
end

get "/cpuinfo" do
	content_type "application/json"
	# parse the /proc/cpuinfo to JSON

	# return result
end

get "/meminfo" do
	content_type "application/json"

	# parse the /proc/meminfo to JSON

	# return result
end


get "/uptime" do
	content_type "application/json"
	# parse the /proc/uptime to JSON

	# return result
end
