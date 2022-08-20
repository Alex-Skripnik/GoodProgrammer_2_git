
class Game

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(slovo)
    if (slovo == nil || slovo == "")
      abort "Вы не ввели слово для игры."
    end
    return slovo.split("")
  end

  # 1.спросить букву с консоли
  # 2.проверить результат
  def ask_next_letter
    puts "\n Введите следующую букву."

    letter = ""
    while letter == "" do
      letter = STDIN.gets.encode("UTF-8").chomp
    end
    next_step(letter)
  end

  # Метод next_step должен проверять наличие буквы в загаданом слове
  # Или среди уже названых букв (массив @good_letters, @bad_letters)
  # Аналог метода check_result в первой версии "Виселицы"
  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end
    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end
    if @letters.include?(bukva)
      @good_letters << bukva
      if @good_letters.size == @letters.uniq.size
        @status = 1
      end

    else
      @bad_letters << bukva
      @errors += 1
      if @errors >=7
        @status = -1
      end
    end
  end

  # сеттеры
  def letters
    @letters # если это последняя строка метода то слово return можно не писать
  end
  def good_letters
    @good_letters
  end
  def bad_letters
    @bad_letters
  end
  def status
    @status
  end
  def errors
    @errors
  end

end
