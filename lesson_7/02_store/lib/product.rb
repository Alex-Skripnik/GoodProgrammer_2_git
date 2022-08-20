#
# Класс-родитель Товар, у которого есть цена и остаток на складе. От этого
# класса мы будем наследовать все другие товары.
class Product
  # Чтобы цену и остаток товара можно было менять прямо по ссылке экземпляра:
  #
  # product.price = 100
  #
  # Мы должны объявить методы-сеттеры для каждой из переменных.
  #
  # def price=(price)
  #   @price = price
  # end
  #
  # Также это можно сделать с помощью attr_accessor
  attr_accessor :price, :amout

  def initialize(params)
    @price = params[:price]
    @amout = params[:amout]
  end

  def to_s
    "#{@price} руб. (осталось #{@amout})"
  end

  # Метод update у родителя обновляет только цену и количество товара, если эти
  # ключи были переданы в ассоциативном массиве на вход
  def update(params)
    @price = params[:price] if params[:price]
    @amout = params[:amout] if params[:amout]
  end
end
