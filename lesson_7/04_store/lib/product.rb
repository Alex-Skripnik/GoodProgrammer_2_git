
#
# Класс-родитель Товар, у которого есть цена и остаток на складе. От этого
# класса мы будем наследовать все другие товары.
class Product
  attr_accessor :price, :amout

  def initialize(params)
    @price = params[:price]
    @amout = params[:amout]
  end

  def to_s
    "#{@price} руб. (осталось #{@amout})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amout = params[:amout] if params[:amout]
  end

  # Абстрактный метод from_file для продукта не имеет смысла, т.к. абстрактный
  # продукт из файла мы прочитать не сможем (мы не знаем, например, формат),
  # поэтому если он не определен у родителя, он будет возвращать ошибку. Класс
  # ошибки так и называется «ошибка отустствия имлементации».
  def self.from_file(file_path)
    raise NotImplementedError
  end
end
