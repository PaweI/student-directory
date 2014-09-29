# create interactive input user method
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# let's create an empty array
	students = []
	# get name
	name = gets.chomp
	while !name.empty? do
		# add student hash to array
		students << {:name => name, :cohort => :october}
		puts "Now we have #{students.length} students"
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

#lets call this methods
students = input_students
print_header
print(students)
print_footer(students)
