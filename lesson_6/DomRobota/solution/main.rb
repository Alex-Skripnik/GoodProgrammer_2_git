#
# Программа «Непослушные дети»
#
# (с) rubyrush.ru

# Подключаем классы Parent и Child
require_relative 'parent'
require_relative 'child'

# Делаем родителя
papa = Parent.new('Василий Игоревич')

# Делаем детей ;)
macha = Child.new('Маша')
kolya = Child.new('Коля')

# Проверяем, кто послушный, а кто нет
puts "#{papa.name} послушный: #{papa.obedient}"
puts "#{macha.name} послушная: #{macha.obedient}"
puts "#{kolya.name} послушный: #{kolya.obedient}"