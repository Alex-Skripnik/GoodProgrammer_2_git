
#
# Класс Книга
class Book < Product
  # Объявим методы-геттеры для переменных экземпляра класса Книга:
  #
  # @title — название книги
  # @genre — жанр (проза, роман, повесть…)
  # @author — фамилия и имя автора
  attr_reader :title, :genre, :author

  # В конструкторе класса Book вызовем конструктор класса-родителя Product,
  # он заполнит переменные экземпляра @price и @amount, а остальные поля,
  # специфичные только для книги, заполним мы самостоятельно.
  def initialize(params)
    super

    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
  end

  # Метод to_s возвращает строку с описанием книги и дергает родительский метод
  # to_s, чтобы склеить эту строку с ценой и остатком.
  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@author}, #{super}"
  end
end
