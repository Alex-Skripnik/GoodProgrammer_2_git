
#
# Программа-магазин книг и фильмов. Версия 0.3 — с сетерами и методом update
# для родителя и классов-детей Book и Film и методами to_s.
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
require_relative 'lib/film'
require_relative 'lib/book'

# Создадим несколько продуктов и поменяем их с помощью сеттеров и метода update
film = Film.new(title: 'Леон', director: 'Люк Бессон', price: 990)
film.year = 1994
film.update(amout: 5)

book = Book.new(title: 'Идиот', genre: 'роман', amout: 10)
book.author = 'Федька Достоевский'
book.update(author: 'Федор Достоевский', price: 1500)

# Выведем результат на экран
puts film
puts book
