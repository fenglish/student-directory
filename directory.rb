def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    if students.count != 0
        list_cohorts = students.map{|student| student[:cohort]}.uniq
        list_cohorts.each do |chrt|
            puts "[The #{chrt} cohort]:"
            puts students.map{|student| student[:name] if student[:cohort] == chrt }.compact
            puts ""
        end
    else
        puts "You haven't enter any student's info yet."
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def input_students
    
    #create an empty array
    students = []
    # get the name & the cohort
    ask_info
    name = gets.rstrip
    cohort = gets.rstrip
    
    # while the name & the cohort are not empty, repeat this code
    while !name.empty? || !cohort.empty? do
        name = "Anonymous" if name.empty?
        cohort = "november" if cohort.empty?
        confirm_info(name, cohort)
        conf_n = gets.rstrip
        
        # while their info are wrong, repeat this code
        while conf_n != "1"
            ask_info
            name = gets.rstrip
            cohort = gets.rstrip
            name = "Anonymous" if name.empty?
            cohort = "november" if cohort.empty?
            confirm_info(name, cohort)
            conf_n = gets.rstrip
        end
    
        # add the student hash to the array
        students << {name: name, cohort: cohort.to_sym}
        
        # singular form when appropriate and plural form otherwise
        students.count > 1 ? s_or_p = "students" : s_or_p = "student"
        puts "Now we have #{students.count} #{s_or_p}"

        # get another info from the user
        ask_info
        name = gets.rstrip
        cohort = gets.rstrip
    end
    # return the array of students
    students
end

def ask_info
    puts ""
    puts "Please enter the names of the students first,"
    puts "then enter the cohort of the students"
    puts "To finish, just hit return twice"
    puts "> "
end

def confirm_info(name, cohort)
    puts "Name: [#{name}], Cohort: [#{cohort}]"
    puts "Yes => 1, No => 2"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
