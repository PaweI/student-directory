#put students into array
students = [
	{:name => 1, :cohort => :october},
	{:name => 2, :cohort => :october},
	{:name => 3, :cohort => :october},
	{:name => 4, :cohort => :october},
	{:name => 5, :cohort => :october},
	{:name => 6, :cohort => :october},
	{:name => 7, :cohort => :october},
	{:name => 8, :cohort => :october},
	{:name => 9, :cohort => :october},
	{:name => 10, :cohort => :october},
	{:name => 11, :cohort => :october},
	{:name => 12, :cohort => :october},
	{:name => 13, :cohort => :october},
	{:name => 14, :cohort => :october},
	{:name => 15, :cohort => :october}
]

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
print_header
print(students)
print_footer(students)
