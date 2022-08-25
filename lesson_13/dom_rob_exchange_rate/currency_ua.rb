#
# (с) rubyrush.ru
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Экспорт курсов валют Национального Банка Украины
# https://pf-soft.net/services/kursy-valut-nbu/export.html

# Подключаем нужные библиотеки
require 'net/http'
require 'rexml/document'

URL = 'http://pf-soft.net/service/currency/'

# Достаем данные с сайта Центробанка и записываем их в XML
response = Net::HTTP.get_response(URI.parse(URL))
doc = REXML::Document.new(response.body)

# Для того, чтобы найти курс валюты, необходимо знать её ID в XML-файле
#
# 6 — доларів США
# 8 — ЄВРО
# 16 — польських злотих
# 3 — англійських фунтів стерлінгів

# Найдём в документе соответствующие элементы
puts "Курс валют Национального Банка Украины"
puts
doc.each_element('//Valute[@id="6" or @id="8" or @id="16" or @id="3"]') do |currency_tag|
  # Достаём название валюты и курс
  name = currency_tag.get_text('Name')
  value = currency_tag.get_text('Value')

  # Аккуратно выводим пользователю
  puts "#{name}: #{value} грн."
end
