=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Класс списка ###
class MyList
  attr_reader :size       # Получить длину списка (текущее количество элементов)
  attr_reader :capacity   # Получить ёмкость списка

  ### Конструктор ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### Доступ к элементу ###
  def get(index)
    # При выходе индекса за границы выбросить исключение. То же правило действует ниже
    raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size
    @arr[index]
  end

  ### Доступ к элементу ###
  def set(index, num)
    raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size
    @arr[index] = num
  end

  ### Добавление элемента в конец ###
  def add(num)
    # Если для элементов не хватает места, увеличить ёмкость
    extend_capacity if size == capacity
    @arr[size] = num

    # Обновить количество элементов
    @size += 1
  end

  ### Вставка элемента в середину ###
  def insert(index, num)
    raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size

    # Если для элементов не хватает места, увеличить ёмкость
    extend_capacity if size == capacity

    # Сдвинуть все элементы начиная с index на одну позицию вправо
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Обновить количество элементов
    @size += 1
  end

  ### Удаление элемента ###
  def remove(index)
    raise IndexError, "Индекс за пределами списка" if index < 0 || index >= size
    num = @arr[index]

    # Сдвинуть все элементы после index на одну позицию влево
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Обновить количество элементов
    @size -= 1

    # Вернуть удалённый элемент
    num
  end

  ### Увеличение ёмкости списка ###
  def extend_capacity
    # Создать массив в extend_ratio раз длиннее исходного и скопировать в него исходный массив
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # Обновить ёмкость списка
    @capacity = arr.length
  end

  ### Преобразовать список в массив ###
  def to_array
    sz = size
    # Преобразовать только используемую часть списка
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Демонстрационный код ###
if __FILE__ == $0
  # Инициализация списка
  nums = MyList.new

  # Добавление элемента в конец
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "Список nums = #{nums.to_array}, ёмкость = #{nums.capacity}, длина = #{nums.size}"

  # Вставка элемента в середину
  nums.insert(3, 6)
  puts "После вставки числа 6 по индексу 3 nums = #{nums.to_array}"

  # Удаление элемента
  nums.remove(3)
  puts "После удаления элемента по индексу 3 nums = #{nums.to_array}"

  # Доступ к элементу
  num = nums.get(1)
  puts "Элемент по индексу 1: num = #{num}"

  # Изменение элемента
  nums.set(1, 0)
  puts "После записи 0 по индексу 1 nums = #{nums.to_array}"

  # Проверка увеличения ёмкости
  for i in 0...10
    # При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
    nums.add(i)
  end
  puts "После увеличения ёмкости список nums = #{nums.to_array}, ёмкость = #{nums.capacity}, длина = #{nums.size}"
end
