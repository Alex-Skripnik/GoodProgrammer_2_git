
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

  def to_db_hash
    # вызываем родительский метод ключевым словом super и к хэшу, который он вернул
    # присоединяем прицепом специфичные для этого класса поля методом Hash#merge
    return super.merge(
      {
        'text' => @text.join('\n\r') # массив строк делаем одной большой строкой, разделенной символами перевода строки
      }
    )
  end

  # загружаем свои поля из хэш массива
  def load_data(data_hash)
    super(data_hash) # сперва дергаем родительский метод для общих полей

    # теперь прописываем свое специфичное поле
    @text = data_hash['text'].split('\n\r')
  end

end