def temp_converter(option, value)
  case option
    when 1 then puts (value - 32) * 5/9
    when 2 then puts (value * 9/5) + 32
    else puts "Error!"
  end
end

puts "Temperature Converter \n" \
"1 - fahrenheit to celsius. \n" \
"2 - celsius to fahrenheit. \n" \
"Select an option [1-2]:\n"

opt = gets

(puts "Error! Option must be an integer in the range of [1-2]"; return) if ![1,2].include?(opt.to_i)

puts "Input the Temperature:"

temp = gets

if temp.match("[0-9\.]")  #had to use a regex since i dont know any method that checks if a string is numeric
  temp_converter opt.to_i, temp.to_f
else
  puts "Error!, Please enter a valid numeric temperature!"
end
