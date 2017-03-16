## Implementation of the Simple Stats API REST server endpoints

require "json"
require "sinatra"


API_VERSION = "1"

def parse_info(file)
	# parse the /proc/cpuinfo to JSON
	begin
		f = open(file,'r')

		h = {}

		f.readlines.each do |l|
			l.chomp!
			# the regex below breaks the {mem,cpu}info into k/v
			e = l.split(/\t*:\s+/)

			# if our split succeeded, store the k/v
			h.store e[0], e[1] if e.length == 2
		end
	ensure
		f.close
	end

	return h
end


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
	return JSON.generate parse_info('/proc/cpuinfo')
end

get "/meminfo" do
	content_type "application/json"

	# parse the /proc/meminfo to JSON

	# return result
	return JSON.generate parse_info('/proc/meminfo')
end


get "/uptime" do
	content_type "application/json"

	h = {}
	
	# parse the /proc/uptime to JSON
	begin
		f = open('/proc/uptime','r')

		t = f.readline.chomp.split(/\s+/)

		if t.length == 2
			h['Uptime (seconds)'] = t[0]
			h['Idle time (seconds)'] = t[1]
		end
	ensure
		f.close
	end

	# return result
	return JSON.generate h
end
