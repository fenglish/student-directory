# an empty array accessible to all methods
@students = []

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
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
        when "9"
            exit # this will cause the program to terminate
        else
            puts "I don't know what you meant, try again"
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    if @students.count != 0
        list_cohorts = @students.map{|student| student[:cohort]}.uniq
        list_cohorts.each do |chrt|
            puts "[The #{chrt} cohort]:"
            puts @students.map{|student| student[:name] if student[:cohort] == chrt }.compact
            puts ""
        end
    else
        puts "You haven't enter any student's info yet."
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def input_students
    # get the name & the cohort
    ask_info
    name = STDIN.gets.rstrip
    cohort = STDIN.gets.rstrip
    
    # while the name & the cohort are not empty, repeat this code
    while !name.empty? || !cohort.empty? do
        name = "Anonymous" if name.empty?
        cohort = "november" if cohort.empty?
        confirm_info(name, cohort)
        conf_n = STDIN.gets.rstrip
        
        # while their info are wrong, repeat this code
        while conf_n != "1"
            ask_info
            name = STDIN.gets.rstrip
            cohort = STDIN.gets.rstrip
            name = "Anonymous" if name.empty?
            cohort = "november" if cohort.empty?
            confirm_info(name, cohort)
            conf_n = STDIN.gets.rstrip
        end
    
        # add the student hash to the array
        @students << {name: name, cohort: cohort.to_sym}
        
        # singular form when appropriate and plural form otherwise
        @students.count > 1 ? s_or_p = "students" : s_or_p = "student"
        puts "Now we have #{@students.count} #{s_or_p}"

        # get another info from the user
        ask_info
        name = STDIN.gets.rstrip
        cohort = STDIN.gets.rstrip
    end
    # return the array of students
    @students
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # ijterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def try_load_students
    filename = ARGV.first # first argument from the command line
    return if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename) # if it exists
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
        puts "Sorry, #{filename} doesn't exist."
        exit # quit the program
    end
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
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

def show_students
    print_header
    print_students_list
    print_footer
end

# nothing happens until we call the methods
try_load_students
interactive_menu
