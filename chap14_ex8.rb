def print_code
    puts "You are excuting [#{__FILE__}]."
    puts "The code is below:"
    puts "-" * 50
    File.open(__FILE__, "r") do |file|
        file.readlines.each{|line| puts line}
    end
    puts "-" * 50
end

print_code