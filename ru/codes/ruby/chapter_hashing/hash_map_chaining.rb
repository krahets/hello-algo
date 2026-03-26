=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

# ## Хеш-таблица с цепочками ###
class HashMapChaining
  # ## Конструктор ###
  def initialize
    @size = 0 # Количество пар ключ-значение
    @capacity = 4 # Вместимость хеш-таблицы
    @load_thres = 2.0 / 3.0 # Порог коэффициента загрузки, запускающий расширение
    @extend_ratio = 2 # Коэффициент расширения
    @buckets = Array.new(@capacity) { [] } # Массив бакетов
  end

  # ## Хеш-функция ###
  def hash_func(key)
    key % @capacity
  end

  # ## Коэффициент загрузки ###
  def load_factor
    @size / @capacity
  end

  # ## Операция поиска ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Обойти бакет; если найден key, вернуть соответствующее val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # Если key не найден, вернуть nil
    nil
  end

  # ## Операция добавления ###
  def put(key, val)
    # Когда коэффициент загрузки превышает порог, выполнить расширение
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # Обойти бакет; если встретился указанный key, обновить соответствующее val и вернуть результат
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # Если такого key нет, добавить пару ключ-значение в конец
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  # ## Операция удаления ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Обойти бакет и удалить из него пару ключ-значение
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  # ## Расширить хеш-таблицу ###
  def extend
    # Временно сохранить исходную хеш-таблицу
    buckets = @buckets
    # Инициализировать новую хеш-таблицу после расширения
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # Перенести пары ключ-значение из исходной хеш-таблицы в новую
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  # ## Вывести хеш-таблицу ###
  def print
    for bucket in @buckets
      res = []
      for pair in bucket
        res << "#{pair.key} -> #{pair.val}"
      end
      pp res
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # ## Инициализировать хеш-таблицу
  hashmap = HashMapChaining.new

  # Операция добавления
  # Добавить в хеш-таблицу пару ключ-значение (key, value)
  hashmap.put(12836, "Сяо Ха")
  hashmap.put(15937, "Сяо Ло")
  hashmap.put(16750, "Сяо Суань")
  hashmap.put(13276, "Сяо Фа")
  hashmap.put(10583, "Утенок")
  puts "\nПосле добавления хеш-таблица имеет вид\n[Key1 -> Value1, Key2 -> Value2,...]"
  hashmap.print

  # Операция поиска
  # Передать ключ key в хеш-таблицу и получить значение value
  name = hashmap.get(13276)
  puts "\nВходномер 13276, найденоимя #{name}"

  # Операция удаления
  # Удалить из хеш-таблицы пару ключ-значение (key, value)
  hashmap.remove(12836)
  puts "\nПосле удаления 12836 хеш-таблица имеет вид\n[Key1 -> Value1, Key2 -> Value2,...]"
  hashmap.print
end
