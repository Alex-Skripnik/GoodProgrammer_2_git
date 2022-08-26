#
# Программа решатель квадратного уравнения, версия для изучения дебагера
#
# (с) rubyrush.ru

puts 'Solve equation: A * x^2 + B * x + C = 0'

puts 'Enter A:'
a = gets.to_f

puts 'Enter B:'
b = gets.to_f

puts 'Enter C:'
c = gets.to_f

# Считаем дискриминант
discr = b * b - 4 * a * c

# Первый корень
x1 = (-b + Math.sqrt(discr)/(2 * a))

# Второй корень
x2 = (-b - Math.sqrt(discr)/(2 * a))

puts 'Solution1:'
puts x1

puts 'Solution2:'
puts x2

# Проверим несколько хитрых случаев:
#
# 0 -1 -1
# D > 0; 2 корня:
# x1 = inf
# x2 = nan
#
# 3, 2, 1
# Программа вылетает: непорядок! Эти ошибки можно найти с помощью дебагера, они
# исправлены в файле equation_good.rb