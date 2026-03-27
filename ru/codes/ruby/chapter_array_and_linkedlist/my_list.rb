=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс списка ###
class MyList
  attr_reader :size       # Получить длину списка (текущее число элементов)
  attr_reader :capacity   # Получить вместимость списка

  # ## Конструктор ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  # ## Доступ к элементу ###
  def get(index)
    # Если индекс выходит за границы, выбрасывается исключение; далее аналогично
    raise IndexError, "индекс выходит за границы" if index < 0 || index >= size
    @arr[index]
  end

  # ## Доступ к элементу ###
  def set(index, num)
    raise IndexError, "индекс выходит за границы" if index < 0 || index >= size
    @arr[index] = num
  end

  # ## Добавление элемента в конец ###
  def add(num)
    # При превышении вместимости по числу элементов запускается расширение
    extend_capacity if size == capacity
    @arr[size] = num

    # Обновить число элементов
    @size += 1
  end

  # ## Вставка элемента в середину ###
  def insert(index, num)
    raise IndexError, "индекс выходит за границы" if index < 0 || index >= size

    # При превышении вместимости по числу элементов запускается расширение
    extend_capacity if size == capacity

    # Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Обновить число элементов
    @size += 1
  end

  # ## Удаление элемента ###
  def remove(index)
    raise IndexError, "индекс выходит за границы" if index < 0 || index >= size
    num = @arr[index]

    # Сдвинуть все элементы после индекса index на одну позицию вперед
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Обновить число элементов
    @size -= 1

    # Вернуть удаленный элемент
    num
  end

  # ## Расширение списка ###
  def extend_capacity
    # Создать новый массив длиной в extend_ratio раз больше исходного и скопировать в него исходный массив
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # Обновить вместимость списка
    @capacity = arr.length
  end

  # ## Преобразование списка в массив ###
  def to_array
    sz = size
    # Преобразовывать только элементы списка в пределах фактической длины
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация списка
  nums = MyList.new

  # Добавление элемента в конец
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "Список nums = #{nums.to_array}, емкость = #{nums.capacity}, длина = #{nums.size}"

  # Вставка элемента в середину
  nums.insert(3, 6)
  puts "После вставки числа 6 по индексу 3 nums = #{nums.to_array}"

  # Удаление элемента
  nums.remove(3)
  puts "После удаления элемента по индексу 3 nums = #{nums.to_array}"

  # Доступ к элементу
  num = nums.get(1)
  puts "Элемент по индексу 1: num = #{num}"

  # Обновление элемента
  nums.set(1, 0)
  puts "После обновления элемента по индексу 1 до 0 nums = #{nums.to_array}"

  # Проверка механизма расширения
  for i in 0...10
    # При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
    nums.add(i)
  end
  puts "После расширения список nums = #{nums.to_array}, емкость = #{nums.capacity}, длина = #{nums.size}"
end
