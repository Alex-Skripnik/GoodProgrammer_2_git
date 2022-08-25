# Подключаем библиотеку для работы с датами
require 'date'

# Класс Прогноз Метеосервиса — соответствует одному тегу <FORECAST>
class MeteoserviceForecast
  # Массивы строк для времени суток и степени облачности
  CLOUDINESS = {-1 => "Туман", 0 => "Ясно", 1 => "Малооблачно", 2 => "Облачно", 3 => "Пасмурно"}
  TIME_OF_DAY = %w(ночь утро день вечер).freeze
  WEEKDAY = {1 => "Воскресенье", 2 => "Понедельник", 3 => "Вторник", 4 => "Среда", 5 => "Четверг",
             6 => "Пятница", 7 => "Суббота"}
  PRECIPITATION = {3 => "Смешаные", 4 => "Дождь", 5 => "Ливень", 6 => "Снег", 7 => "Снег",
                   8 => "Гроза", 9 => "Нет данных", 10 => "Без осадков"}

  # Конструктор класса записывает переданные параметры в соответствующие
  # переменные экземпляра класса
  def initialize(params)
    @date = params[:date]
    @time_of_day = params[:time_of_day]
    @temperature_min = params[:temperature_min]
    @temperature_max = params[:temperature_max]
    @cloudiness = params[:cloudiness]
    @max_wind = params[:max_wind]
    @weekday = params[:weekday]
    @precipitation = params[:precipitation]
  end

  # Метод класса from_xml_node возвращает экземпляр класса, прочитанные из
  # элемента XML-структуры с прогнозом
  def self.from_xml(node)
    day = node.attributes['day']
    month = node.attributes['month']
    year = node.attributes['year']

    new(
      date: Date.parse("#{day}.#{month}.#{year}"),
      time_of_day: TIME_OF_DAY[node.attributes['tod'].to_i],
      temperature_max: node.elements['TEMPERATURE'].attributes['max'].to_i,
      temperature_min: node.elements['TEMPERATURE'].attributes['min'].to_i,
      cloudiness: node.elements['PHENOMENA'].attributes['cloudiness'].to_i,
      max_wind: node.elements['WIND'].attributes['max'].to_i,
      weekday: WEEKDAY[node.attributes['weekday'].to_i],
      precipitation: node.elements['PHENOMENA'].attributes['precipitation'].to_i
    )
  end

  def to_s
    result = today? ? 'Сегодня' : @date.strftime('%d.%m.%Y')
    result << ", #{@weekday} - #{@time_of_day}\n" \
    "#{temperature_range_string}, ветер #{@max_wind} m/c, " \
    "#{CLOUDINESS[@cloudiness]}\n" \
    "#{PRECIPITATION[@precipitation]}"
    result
  end

  def temperature_range_string
    result = ''
    result << '+' if @temperature_min > 0
    result << "#{@temperature_min}.."
    result << '+' if @temperature_max > 0
    result << @temperature_max.to_s
    result
  end

  def today?
    @date == Date.today
  end

end
