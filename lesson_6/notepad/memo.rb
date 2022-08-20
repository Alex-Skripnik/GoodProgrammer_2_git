
# Класс "Заметка", разновидность базового класса "Запись"
class Memo < Post
  # отдельный конструктор здесь не нужен, т. к. он совпадает с родительским

  # Этот метод пока пустой, он будет спрашивать ввод содержимого Заметки
  # наподобие программы Дневник из "базового блока" курса
  def read_from_console
    puts "Новая заметка (все, что пишется до строчки \"end\"): "

    @text = []
    line = nil

    while line != "end" do
      line = STDIN.gets.chomp
      @text << line
    end
    @text.pop

  end

  # Этот метод будет возвращать массив из строк заметки + строка-дата создания
  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    return @text.unshift(time_string)

  end

end