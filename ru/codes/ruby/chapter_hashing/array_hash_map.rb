=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Пара ключ-значение ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

# ## Хеш-таблица на основе массива ###
class ArrayHashMap
  # ## Конструктор ###
  def initialize
    # Инициализировать массив, содержащий 100 корзин
    @buckets = Array.new(100)
  end

  # ## Хеш-функция ###
  def hash_func(key)
    index = key % 100
  end

  # ## Операция поиска ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  # ## Операция добавления ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  # ## Операция удаления ###
  def remove(key)
    index = hash_func(key)
    # Присвоить nil, что означает удаление
    @buckets[index] = nil
  end

  # ## Получить все пары ключ-значение ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  # ## Получить все ключи ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  # ## Получить все значения ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  # ## Вывести хеш-таблицу ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация хеш-таблицы
  hmap = ArrayHashMap.new

  # Операция добавления
  # Добавить пару (key, value) в хеш-таблицу
  hmap.put(12836, "Сяо Ха")
  hmap.put(15937, "Сяо Ло")
  hmap.put(16750, "Сяо Суань")
  hmap.put(13276, "Сяо Фа")
  hmap.put(10583, "Сяо Я")
  puts "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение"
  hmap.print

  # Операция поиска
  # По ключу key получить из хеш-таблицы значение value
  name = hmap.get(15937)
  puts "\nДля номера 15937 найдено имя #{name}"

  # Операция удаления
  # Удалить пару значений (key, value) из хеш-таблицы
  hmap.remove(10583)
  puts "\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение"
  hmap.print

  # Обход хеш-таблицы
  puts "\nОтдельный обход пар ключ-значение"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nОтдельный обход ключей"
  for key in hmap.key_set
    puts key
  end

  puts "\nОтдельный обход значений"
  for val in hmap.value_set
    puts val
  end
end
