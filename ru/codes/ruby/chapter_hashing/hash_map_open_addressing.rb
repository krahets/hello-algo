=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Хеш-таблица с открытой адресацией ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # Метка удаления

  ### Конструктор ###
  def initialize
    @size = 0 # Число пар «ключ — значение»
    @capacity = 4 # Ёмкость хеш-таблицы
    @load_thres = 2.0 / 3.0 # Порог коэффициента заполнения для расширения
    @extend_ratio = 2 # Во сколько раз увеличивается ёмкость
    @buckets = Array.new(@capacity) # Массив корзин
  end

  ### Хеш-функция ###
  def hash_func(key)
    key % @capacity
  end

  ### Коэффициент заполнения ###
  def load_factor
    @size / @capacity.to_f
  end

  ### Найти индекс корзины для ключа key ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # Линейное пробирование до первой пустой корзины
    while !@buckets[index].nil?
      # При совпадении ключа key вернуть индекс его корзины
      if @buckets[index].key == key
        # Если ранее встретилась метка удаления, переместить пару на её место
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # Вернуть индекс корзины после перемещения
        end
        return index # Вернуть индекс корзины
      end
      # Запомнить первую встретившуюся метку удаления
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # Вычислить индекс корзины, после конца массива перейти в начало
      index = (index + 1) % @capacity
    end
    # Если ключа key нет, вернуть индекс для вставки
    first_tombstone == -1 ? index : first_tombstone
  end

  ### Поиск ###
  def get(key)
    # Найти индекс корзины для ключа key
    index = find_bucket(key)
    # Если пара найдена, вернуть её значение val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # Если пары нет, вернуть nil
    nil
  end

  ### Вставка ###
  def put(key, val)
    # Расширить таблицу, если коэффициент заполнения превысил порог
    extend if load_factor > @load_thres
    # Найти индекс корзины для ключа key
    index = find_bucket(key)
    # Если пара найдена, заменить val и завершить операцию
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # Если пары нет, добавить её
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### Удаление ###
  def remove(key)
    # Найти индекс корзины для ключа key
    index = find_bucket(key)
    # Если пара найдена, заменить её меткой удаления
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### Расширить хеш-таблицу ###
  def extend
    # Временно сохранить исходную хеш-таблицу
    buckets_tmp = @buckets
    # Создать новую таблицу увеличенной ёмкости
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # Перенести пары из исходной таблицы в новую
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### Вывести хеш-таблицу ###
  def print
    for pair in @buckets
      if pair.nil?
        puts "Nil"
      elsif pair == TOMBSTONE
        puts "TOMBSTONE"
      else
        puts "#{pair.key} -> #{pair.val}"
      end
    end
  end
end

### Демонстрационный код ###
if __FILE__ == $0
  # Создать хеш-таблицу
  hashmap = HashMapOpenAddressing.new

  # Вставка
  # Добавить в таблицу пару (key, val)
  hashmap.put(12836, "Сяо Ха")
  hashmap.put(15937, "Сяо Ло")
  hashmap.put(16750, "Сяо Суань")
  hashmap.put(13276, "Сяо Фа")
  hashmap.put(10583, "Сяо Я")
  puts "\nХеш-таблица после вставки:\nКлюч -> Значение"
  hashmap.print

  # Поиск
  # Получить из таблицы значение val по ключу key
  name = hashmap.get(13276)
  puts "\nИмя студента с номером 13276: #{name}"

  # Удаление
  # Удалить из таблицы пару (key, val)
  hashmap.remove(16750)
  puts "\nХеш-таблица после удаления 16750:\nКлюч -> Значение"
  hashmap.print
end
