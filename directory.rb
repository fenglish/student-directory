def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    count = 0
    while count < students.count
        puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort), and you like #{students[count][:food]}!"
        count += 1
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    # get the first name
    name = gets.chomp
    puts "Tell me your favorite food!"
    food = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november, food: food}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
        if !name.empty?
            puts "Tell me your favorite food!"
            food = gets.chomp
        end
    end
    # return the array of students
    students
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
