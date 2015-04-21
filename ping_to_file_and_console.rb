# Basically the pinging and writing to file is done by the shell command in POpen4::popen4 and the console output is handled by Ruby

require 'rubygems'
require 'popen4'

def run
	time = Time.new.to_i.to_s + ".txt"

    POpen4::popen4("ping -i2 google.com | while read pong; do echo \"$(date +\'%c\') | $pong\"; done | tee #{time}") do |stdout, stderr, stdin, pid|
    	while s = stdout.gets
        	puts s
        end
    end
end

run