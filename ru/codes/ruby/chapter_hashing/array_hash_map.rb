=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## пара ключ-значение ###
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
    # Инициализировать массив, содержащий 100 бакетов
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
    # Установить nil, обозначая удаление
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
  # Инициализировать хеш-таблицу
  hmap = ArrayHashMap.new

  # Операция добавления
  # Добавить в хеш-таблицу пару ключ-значение (key, value)
  hmap.put(12836, "Сяо Ха")
  hmap.put(15937, "Сяо Ло")
  hmap.put(16750, "Сяо Суань")
  hmap.put(13276, "Сяо Фа")
  hmap.put(10583, "Утенок")
  puts "\nПосле добавления хеш-таблица имеет вид\nKey -> Value"
  hmap.print

  # Операция поиска
  # Ввести ключ key в хеш-таблицу и получить значение value
  name = hmap.get(15937)
  puts "\nВходномер 15937, найденоимя #{name}"

  # Операция удаления
  # Удалить пару значений (key, value) из хеш-таблицы
  hmap.remove(10583)
  puts "\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value"
  hmap.print

  # Перебрать хеш-таблицу
  puts "\nОбойтипара ключ-значение Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nОтдельный обход ключей Key"
  for key in hmap.key_set
    puts key
  end

  puts "\nотдельноОбойтизначение Value"
  for val in hmap.value_set
    puts val
  end
end
