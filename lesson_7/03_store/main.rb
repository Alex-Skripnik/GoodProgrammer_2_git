#
# Программа-магазин книг и фильмов. Версия 0.4 — с методом класса from_file для
# каждого класса-ребенка (для родителя метод вызывает ошибку)
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

# Считываем наши книгу и фильм из папок data/books и data/films соответственно
current_path = File.dirname(__FILE__ )
film = Film.from_file(current_path + "/data/films/01.txt")
book = Book.from_file(current_path + "/data/books/01.txt")

# Выводим их на экран
puts film
puts book

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
  Product.from_file(current_path + "/data/films/01.txt")
rescue NotImplementedError
  puts "Метод класса Product.from_file не реализован"
end