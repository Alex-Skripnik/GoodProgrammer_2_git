#
# Класс Фильм
class Film < Product
  # Аналогично классу Product мы объями сеттеры и геттеры для переменных
  # экземпляра класса Film с помощью attr_accessor, чтобы их можно было менять
  # из основной программы.
  attr_accessor :title, :year, :director

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм \"#{@title}\", #{@year}, реж. #{@director}, #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя, чтобы тот обновил цену и остаток.
  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
