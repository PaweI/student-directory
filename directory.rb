#put students into array
students = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

def print_header
	puts "The students of my cohort at Makers Academy"
	"------------------"
end

def print(names) 
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} prospective students"
end

#lets call this methods
print_header
print(students)
print_footer(students)
