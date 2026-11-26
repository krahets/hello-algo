=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Двусторонняя очередь (дек) на основе кольцевого массива ###
class ArrayDeque
  ### Получить длину дека ###
  attr_reader :size

  ### Конструктор ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### Получить ёмкость дека ###
  def capacity
    @nums.length
  end

  ### Проверить, пуст ли дек ###
  def is_empty?
    size.zero?
  end

  ### Добавить элемент в начало дека ###
  def push_first(num)
    if size == capacity
      puts 'Дек заполнен'
      return
    end

    # Сдвинуть индекс начала дека на одну позицию влево
    # При выходе за начало массива операция взятия остатка возвращает front в конец
    @front = index(@front - 1)
    # Добавить num в начало дека
    @nums[@front] = num
    @size += 1
  end

  ### Добавить элемент в конец дека ###
  def push_last(num)
    if size == capacity
      puts 'Дек заполнен'
      return
    end

    # Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
    rear = index(@front + size)
    # Добавить num в конец дека
    @nums[rear] = num
    @size += 1
  end

  ### Извлечь элемент из начала дека ###
  def pop_first
    num = peek_first
    # Сдвинуть индекс начала дека на одну позицию вперёд
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### Извлечь элемент из конца дека ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### Посмотреть первый элемент дека ###
  def peek_first
    raise IndexError, 'Дек пуст' if is_empty?

    @nums[@front]
  end

  ### Посмотреть последний элемент дека ###
  def peek_last
    raise IndexError, 'Дек пуст' if is_empty?

    # Вычислить индекс последнего элемента
    last = index(@front + size - 1)
    @nums[last]
  end

  ### Вернуть массив для вывода ###
  def to_array
    # Преобразовать только те элементы, которые сейчас находятся в деке
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### Вычислить индекс в кольцевом массиве ###
  def index(i)
    # Операция взятия остатка связывает конец массива с его началом
    # Если индекс i выходит за конец массива, отсчёт продолжается с начала
    # Если индекс i выходит за начало массива, отсчёт продолжается с конца
    (i + capacity) % capacity
  end
end

### Пример использования ###
if __FILE__ == $0
  # Инициализировать дек
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "Дек deque = #{deque.to_array}"

  # Посмотреть первый и последний элементы
  peek_first = deque.peek_first
  puts "Первый элемент дека peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "Последний элемент дека peek_last = #{peek_last}"

  # Добавить элементы в дек
  deque.push_last(4)
  puts "После добавления 4 в конец дека deque = #{deque.to_array}"
  deque.push_first(1)
  puts "После добавления 1 в начало дека deque = #{deque.to_array}"

  # Извлечь элементы из дека
  pop_last = deque.pop_last
  puts "Извлечённый последний элемент = #{pop_last}, после извлечения deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Извлечённый первый элемент = #{pop_first}, после извлечения deque = #{deque.to_array}"

  # Получить длину дека
  size = deque.size
  puts "Длина дека size = #{size}"

  # Проверить, пуст ли дек
  is_empty = deque.is_empty?
  puts "Дек пуст = #{is_empty}"
end
