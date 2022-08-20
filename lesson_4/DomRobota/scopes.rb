
# Программа, которая демонстрирует понятие области видимости
#
# (с) rubyrush.ru

# Напишем метод, в котором определим переменную c
def method
  c = 3

  # Посмотрим, какие переменные определены внутри метода
  puts "Переменная '$a': #{defined?($a)}"
  puts "Переменная 'b': #{defined?(b)}"
  puts "Переменная 'c': #{defined?(c)}"
  puts
end

# Определим глобальную переменную
$a = 1

# Определим локальную переменную вне метода
b = 2

# Вызовем метод
method

# Посмотрим, какие переменные определены вне метода
puts "Переменная '$a': #{defined?($a)}"
puts "Переменная 'b': #{defined?(b)}"
puts "Переменная 'c': #{defined?(c)}"