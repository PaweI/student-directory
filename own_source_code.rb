p "Short program to print its own code"
p "Please print your name:"

def source(name)
	p "Hello, #{name}"
	p "Do you want to see code for this script?"
	answer = gets.chomp
	if answer == "yes"
		File.readlines($0).each { |line| p line }
	else
		exit
	end
end

source(gets.chomp)
