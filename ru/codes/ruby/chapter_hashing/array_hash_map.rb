=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Пара «ключ — значение» ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

### Хеш-таблица на основе массива ###
class ArrayHashMap
  ### Конструктор ###
  def initialize
    # Создать массив из 100 корзин
    @buckets = Array.new(100)
  end

  ### Хеш-функция ###
  def hash_func(key)
    index = key % 100
  end

  ### Поиск ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### Вставка ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### Удаление ###
  def remove(key)
    index = hash_func(key)
    # Записать nil в знак удаления
    @buckets[index] = nil
  end

  ### Получить все пары «ключ — значение» ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### Получить все ключи ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### Получить все значения ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### Вывести хеш-таблицу ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Демонстрационный код ###
if __FILE__ == $0
  # Создать хеш-таблицу
  hmap = ArrayHashMap.new

  # Вставка
  # Добавить в таблицу пару (key, value)
  hmap.put(12836, "Сяо Ха")
  hmap.put(15937, "Сяо Ло")
  hmap.put(16750, "Сяо Суань")
  hmap.put(13276, "Сяо Фа")
  hmap.put(10583, "Сяо Я")
  puts "\nХеш-таблица после вставки:\nКлюч -> Значение"
  hmap.print

  # Поиск
  # Получить из таблицы значение value по ключу key
  name = hmap.get(15937)
  puts "\nИмя студента с номером 15937: #{name}"

  # Удаление
  # Удалить из таблицы пару (key, value)
  hmap.remove(10583)
  puts "\nХеш-таблица после удаления 10583:\nКлюч -> Значение"
  hmap.print

  # Обход хеш-таблицы
  puts "\nОбход пар «ключ -> значение»"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nОбход только ключей"
  for key in hmap.key_set
    puts key
  end

  puts "\nОбход только значений"
  for val in hmap.value_set
    puts val
  end
end
