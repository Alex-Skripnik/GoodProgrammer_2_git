#
# Программа-магазин книг и фильмов. Версия 0.2 — с персональными конструкторами
# для классов-детей Book и Film и методами to_s.
#
# (с) goodprogrammer.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'


# Воспользуемся крутыми конструкторами для классов Film и Book и создадим
# несколько товаров.
products = []

products << Film.new(
  title: "Дурак", year: '2014', director: 'Юрий Быков', price: 390, amout: 1
)

products << Film.new(
  title: 'Леон', year: '1994', director: 'Люк Бессон', price: 990, amout: 5
)

products << Book.new(
  title: 'Идиот',
  genre: 'роман',
  author: 'Федор Достоевкий',
  price: 1500,
  amout: 10
)

# Выводим все продукты в консоль просто передавая их методу puts
puts 'Вот какие товары у вас есть: '
puts
products.each { |product| puts product }
