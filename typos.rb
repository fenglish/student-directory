def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print(students)
  if students.count != 0
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    puts "Overall, we have #{students.count} great students"
  else
    puts "You haven't enter any student's info yet."
  end
end

students = input_students
print(students)