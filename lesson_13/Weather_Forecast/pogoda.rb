# подключаем либы для работы с сетью и XML
require "net/http"
require "uri"
require "rexml/document"

# создаем объект-адрес где лежит погода Москвы в иде XML
uri = URI.parse("http://export.yandex.ru/weather-ng/forecasts/27612.xml")

# найти идентификатор своего города можете здесь:
# http://pogoda.yandex.ru/static/cities.xml

# Отправляем запрос по адресу uri и сохраняем результат в переменную response
response = Net::HTTP.get_response(uri)

# puts response.body — так можно вывести на экран содержимое ответа сервера

# парсим полученный XML
doc = REXML::Document.new(response.body)

# собираем параметры
city_name = doc.root.attributes['exactname']
time = Time.now
temperature = doc.root.elements['fact/temperature'].text
pogoda = doc.root.elements['fact/weather_type'].text
wind = doc.root.elements['fact/wind_speed'].text

puts "Сейчас #{time}, погода в городе #{city_name}:"
puts "#{temperature} градусов, #{pogoda}, ветер #{wind} м/с"
