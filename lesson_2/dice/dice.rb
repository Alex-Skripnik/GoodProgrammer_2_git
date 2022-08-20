
# Напишем метод, который показывает вращающийся кубик. Для этого 100 раз с
# задержкой в 1 сотую секунды покажем произвольное число и сотрём её потом,
# добавив \r в конце.
def show_rolling_die
  100.times do
    # Вместо puts используем print, т.к. он не добавляет перенос строки в конце
    print "#{rand(6) + 1}\r"
    sleep 0.01
  end
end

puts "how many dice?"
num = gets.to_i
puts

num.times do
  # Вызываем метод вращения кубика
  show_rolling_die
  puts rand(6) + 1
end

