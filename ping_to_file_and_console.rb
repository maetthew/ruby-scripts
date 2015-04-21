# Pings a host and writes it to a .txt file named as a timestamp

require 'rubygems'
require 'popen4'

def run
	time = Time.new.to_i.to_s + ".txt"
	domain = google.com

    POpen4::popen4("ping -i2 #{domain} | while read pong; do echo \"$(date +\'%c\') | $pong\"; done | tee #{time}") do |stdout, stderr, stdin, pid|
    	while s = stdout.gets
        	puts s
        end
    end
end

run