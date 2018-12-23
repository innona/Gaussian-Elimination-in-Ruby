MAXOFELEMENT = 20
puts "Please input the num you want"
num = gets.to_i
num.times do
  (num + 1).times do
    printf("%3d", rand(MAXOFELEMENT + 1))
  end
  puts
end