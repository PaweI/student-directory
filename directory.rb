#put students into array
students = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
#first, we print the list of students
puts "The students of my cohort at Makers Academy"
"------------------"
#now print them 
students.each do |student|
	puts student
end
#then we print total
puts "Overall, we have #{students.length} prospective students"
