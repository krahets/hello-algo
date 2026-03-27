=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс списка ###
class MyList
  attr_reader :size       # Получить длину списка (текущее количество элементов)
  attr_reader :capacity   # Получить вместимость списка

  # ## Конструктор ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  # ## Получить доступ к элементу ###
  def get(index)
    # Если индекс выходит за границы, выбросить исключение; далее аналогично
    raise IndexError, "Индекс вне допустимого диапазона" if index < 0 || index >= size
    @arr[index]
  end

  # ## Получить доступ к элементу ###
  def set(index, num)
    raise IndexError, "Индекс вне допустимого диапазона" if index < 0 || index >= size
    @arr[index] = num
  end

  # ## Добавить элемент в конец ###
  def add(num)
    # Если число элементов превышает вместимость, запустить механизм расширения
    extend_capacity if size == capacity
    @arr[size] = num

    # Обновить количество элементов
    @size += 1
  end

  # ## Вставить элемент в середину ###
  def insert(index, num)
    raise IndexError, "Индекс вне допустимого диапазона" if index < 0 || index >= size

    # Если число элементов превышает вместимость, запустить механизм расширения
    extend_capacity if size == capacity

    # Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Обновить количество элементов
    @size += 1
  end

  # ## Удалить элемент ###
  def remove(index)
    raise IndexError, "Индекс вне допустимого диапазона" if index < 0 || index >= size
    num = @arr[index]

    # Сдвинуть на одну позицию вперед все элементы после индекса index
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Обновить количество элементов
    @size -= 1

    # Вернуть удаленный элемент
    num
  end

  # ## Расширение списка ###
  def extend_capacity
    # Создать новый массив длиной в extend_ratio раз больше исходного и скопировать в него исходный массив
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # ОбновитьВместимость списка
    @capacity = arr.length
  end

  # ## Преобразовать список в массив ###
  def to_array
    sz = size
    # Преобразовать только элементы списка в пределах действительной длины
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать список
  nums = MyList.new

  # Добавить элемент в конец
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "Список nums = #{nums.to_array}, вместимость = #{nums.capacity}, длина = #{nums.size}"

  # Вставить элемент в середину
  nums.insert(3, 6)
  puts "После вставки числа 6 по индексу 3 получаем nums = #{nums.to_array}"

  # Удалить элемент
  nums.remove(3)
  puts "После удаления элемента по индексу 3 получаем nums = #{nums.to_array}"

  # Получить доступ к элементу
  num = nums.get(1)
  puts "обратиться киндекс 1 поэлемент, получаем num = #{num}"

  # Обновить элемент
  nums.set(1, 0)
  puts "После обновления элемента по индексу 1 на 0 получаем nums = #{nums.to_array}"

  # Проверить механизм расширения
  for i in 0...10
    # При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
    nums.add(i)
  end
  puts "Список nums после расширения = #{nums.to_array}, вместимость = #{nums.capacity}, длина = #{nums.size}"
end
