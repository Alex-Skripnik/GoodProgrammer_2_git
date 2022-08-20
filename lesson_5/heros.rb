if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


puts "Врага какого персанажа вы хотите узнать?"

# Объявили новый ассоциативный массив с парами герой-антигерой
heros_antiheros = {
  "Бэтмен" => "Джокер",
  "Холмс" => "Мориарти",
  "Буратино" => "Карабас-Барабас",
  "Фродо Бэггинс" => "Саурон",
  "Моцарт" => "Сальери"
}

# Получили выбор пользователя
hero = STDIN.gets.chomp

# Выводим антигероя, находя нужный элемент в ассоциативном массиве
if heros_antiheros.has_key?(hero) # проверка на наличие ключа в хэше
  puts "Враг этого героя: #{heros_antiheros[hero]}"
else
  puts "Не удалось найти врага"
end