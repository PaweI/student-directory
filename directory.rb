# create interactive input user method

# put cohort value to a separate method, make new feature: notification about typo, 
def input_cohort
    puts "Enter your cohort(you can skip this step by pressing enter again, cohort will be set to default october):"
    cohort = gets.chomp.to_sym
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
	if cohort == :""
	    cohort = :october
	elsif months.include?(cohort)
	    nil
	else
		puts "Sorry, there maybe some mistake in your input."
		# new input using recursive method
		input_cohort
	end
	cohort
end

def input_students
	puts "Please enter the names of the students".center(52, '-') 
	puts "To finish, just hit return twice".center(46, '-')
	# let's create an empty array
	students = []
	# get info
	puts "Enter your name:"
	name = gets.chomp
	# put 
    cohort = input_cohort
	puts "Enter your age:"
	age = gets.chomp
	puts "Enter your country of birth:"
	country_of_birth = gets.chomp
	puts "Write your hobbies, please:"
	hobbies = gets.chomp
	while !name.empty? do
		# add student hash to array
		# default value of cohort
		students << {:name => name, :cohort => cohort, :age => age, :country_of_birth => country_of_birth,
		:hobbies => hobbies}
		output_form = "student" if students.length == 1 || "students"
		puts "Now we have #{students.length} #{output_form}"
		# get another name from the user
		name = gets.chomp
	end
	# return array of students
	students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------------"
end

def print(students) 
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# print name start with input letter
def print_first(students)
	letter = gets.chomp
	students.each do |student|
		if student[:name][0].upcase == letter.upcase
			puts student[:name]
		end
	end
end

# print name shorter than 12 characters
def print_short(students)
	students.each do |student|
		if student[:name].split.join("").length < 12
			puts student[:name]
		end
	end
end

# lets call this methods
students = input_students
print_header
print(students)
print_footer(students)
