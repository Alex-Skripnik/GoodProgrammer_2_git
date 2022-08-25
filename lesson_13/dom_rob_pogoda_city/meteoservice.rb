#
# Программа «Прогноз погоды» Версия 1.2, с прогнозом погоды на неделю
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

require 'net/http'
require 'rexml/document'

require_relative 'lib/meteoservice_forecast'

# Словарик городов, собранных с сайта Метеосервиса. Можно написать код, который
# будет собирать все города и их названия с сайта амтоматически, но мы пока
# этого делать не будем. При необходимости добавляйте свои города руками.
CITTES = {
  37 => 'Москва',
  69 => 'Санкт-Петербург',
  99 => 'Новосибирск',
  59 => 'Пермь',
  115 => 'Орел',
  121 => 'Чита',
  141 => 'Братск',
  199 => 'Краснодар',
  9052 => 'Новая Каховка',
  13 => 'Днепр',
  14 => 'Донецк',
  846 => 'Дрогобич',
  9050 => 'Желтые Воды',
  95 => 'Запорожье',
  24673 => 'Каланчак',
  28791 => 'Каховка',
  33 => 'Мариуполь',
  2886 => 'Мелитополь',
  29832 => 'Мукачево',
  2883 => 'Николаев',
  25 => 'Киев',
  2885 => 'Никополь',
  55 => 'Одесса',
  9095 => 'Славутич',
  1662 => 'Сумы',
  1599 => 'Тернополь',
  29968 => 'Токмак',
  29786 => 'Ужгород',
  9025 => 'Умань',
  22 => 'Харьков',
  848 => 'Херсон',
  26537 => 'Ялта',
}.invert.freeze

# Сделаем массив из наваний городов, взяв ключи массива CITIES
city_names = CITTES.keys

# Спрашиваем у пользователя, какой город по порядку ему нужен
puts "Погоду для какого города Вы хотите узнать?"
city_names.each_with_index {|name, index| puts "#{index+1}: #{name}"}
city_index = gets.to_i
unless city_index.between?(1, city_names.size)
  city_index = gets.to_i
  puts "Введите число от 1 до #{city_index}"
end

# Когда, наконец, получим нуный индекс, достаем city_id
city_id = CITTES[city_names[city_index-1]]

# Сформировали адрес запроса
url = "https://xml.meteoservice.ru/export/gismeteo/point/#{city_id}.xml"

# Дальше все по старому
response = Net::HTTP.get_response(URI.parse(url))
doc = REXML::Document.new(response.body)

city_name = URI.decode_www_form_component(doc.root.elements['REPORT/TOWN'].attributes['sname'])

# Достаем все XML-теги <FORECAST> внутри тега <TOWN> и преобразуем их в массив
forecast_nodes = doc.root.elements['REPORT/TOWN'].elements.to_a

# Выводим название города и все прогнозы по порядку
puts city_name
puts

forecast_nodes.each do |node|
  puts MeteoserviceForecast.from_xml(node)
  puts
end