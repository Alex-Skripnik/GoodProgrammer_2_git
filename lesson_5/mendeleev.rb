if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Таблица, где символу элемента соответствует фамилия его первооткрывателя
table = {
  'H' => 'Кавендиш',
  'He' => 'Локьер, Жансен, Рамзай',
  'Li' => 'Арфведсон',
  'Be' => 'Воклен',
  'B' => 'Дэви и Гей-Люссак',
  'C' => 'неизвестен',
  'N' => 'Резерфорд',
  'O' => 'Пристли и Шееле',
  'F' => 'Муассан',
  'Ne' => 'Рамзай и Траверс'
}

# выводим пользователю что у нас есть — вместе с количеством элементов
puts table.keys

puts "О каком элементе хотите узнать?"

element = gets.chomp

# проверка — есть ли в хэше элемент, который спросил пользователь
if table.has_key?(element)
  puts "Первооткрывателем этого элемента считается: #{table[element]}"
else
  puts "Извините, про такой элемент мы еще не знаем."
end
