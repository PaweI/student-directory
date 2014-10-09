require 'csv'
@students = []

def input_cohort
    puts "Enter your cohort(you can skip this step by pressing enter again, cohort will be set to 'october'):"
    cohort = STDIN.gets.chomp.to_sym
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
	if cohort == :""
		cohort = :october
		return cohort
	elsif months.include?(cohort)
	    return cohort
	else
		puts "Sorry, there maybe some mistake in your input."
		input_cohort
	end
end

def plural_form(students)
	if @students.length == 1
		return "student"
	else 
		return "students"
	end
end

def add_student(name, cohort)
	@students << {:name => name, :cohort => cohort.to_sym}
end


def input_students
	puts "Please enter the names of the students".center(52, '-') 
	puts "To finish, just hit return twice".center(46, '-')
	puts "Enter your name:"
	name = STDIN.gets.chomp
	while !name.empty? do
		cohort = input_cohort
	    puts "Enter your age:"
	    add_student(name, cohort)
		puts "Now we have #{@students.length} #{plural_form(@students)}"
		# get another name from the user
		puts "Enter your name:"
		name = STDIN.gets.chomp
	end
	@students
end

def print_header
	puts "The students at Makers Academy"
	puts "------------------"
end

def print_students_list
	cohorts = []
	@students.each do |student|
		cohorts << student[:cohort] if cohorts.include?(student[:cohort]) != true
	end
	cohorts.each do |cohort|
		puts "#{cohort} cohort:"
		@students.each do |student|
			if cohort == student[:cohort]
				puts "#{student[:name]}"
			end
		end
	end
end

def print_footer
	puts "Overall, we have #{@students.length} great #{plural_form(@students)}"
end

# print name start with input letter
def print_first
	puts "Enter letter, please:"
	letter = STDIN.gets.chomp
	@students.each do |student|
		if student[:name][0].upcase == letter.upcase
			puts student[:name]
		end
	end
end

# print name shorter than 12 characters
def print_short
	@students.each do |student|
		if student[:name].split.join("").length < 12
			puts student[:name]
		end
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list of students"
	puts "4. Load the list of students"
	puts "5. Find student by first letter"
	puts "9. Exit"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def save_students
	puts "Name your students file(you can skip this step, 'students' will be default name):"
	name_file = STDIN.gets.chomp
	name_file = "students" if name_file.length == 0
    file_with_students = name_file + ".csv"
	CSV.open(file_with_students, "wb") do |csv_line|
		@students.each do |student|
        csv_line << [student[:name], student[:cohort]]
        end
	end
end

def load_students(filename=nil)
	puts "Enter filename please (press enter to choose default 'students.csv':"
	filename = STDIN.gets.chomp
    filename = "students.csv" if filename.length == 0
	CSV.foreach(filename) do |line|
		name, cohort = line[0], line[1]
		add_student(name, cohort)
	end
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

def process(selection)
	case selection
	when "1"
	    input_students
    when "2"
	   	show_students
	when "3"
		save_students
	when "4"
		load_students
	when "5"
		print_first
    when "9" # because more functionality might be added
	    exit 
	else "You input is incorrect, please try again"
	end
end

def interactive_menu
	loop do 
		print_menu
		process(STDIN.gets.chomp)
	end
end

try_load_students
interactive_menu
