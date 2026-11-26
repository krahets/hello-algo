=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### Хеш-таблица с цепочками ###
class HashMapChaining
  ### Конструктор ###
  def initialize
    @size = 0 # Число пар «ключ — значение»
    @capacity = 4 # Ёмкость хеш-таблицы
    @load_thres = 2.0 / 3.0 # Порог коэффициента заполнения для расширения
    @extend_ratio = 2 # Во сколько раз увеличивается ёмкость
    @buckets = Array.new(@capacity) { [] } # Массив корзин
  end

  ### Хеш-функция ###
  def hash_func(key)
    key % @capacity
  end

  ### Коэффициент заполнения ###
  def load_factor
    @size / @capacity.to_f
  end

  ### Поиск ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # Если ключ key не найден, вернуть nil
    nil
  end

  ### Вставка ###
  def put(key, val)
    # Расширить таблицу, если коэффициент заполнения превысил порог
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # Обойти корзину. Если найден ключ key, обновить val и завершить операцию
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # Если ключа key нет, добавить пару в конец списка
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### Удаление ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # Обойти корзину и удалить из неё нужную пару
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### Расширить хеш-таблицу ###
  def extend
    # Временно сохранить исходную хеш-таблицу
    buckets = @buckets
    # Создать новую таблицу увеличенной ёмкости
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # Перенести пары из исходной таблицы в новую
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### Вывести хеш-таблицу ###
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

### Демонстрационный код ###
if __FILE__ == $0
  ### Создать хеш-таблицу
  hashmap = HashMapChaining.new

  # Вставка
  # Добавить в таблицу пару (key, value)
  hashmap.put(12836, "Сяо Ха")
  hashmap.put(15937, "Сяо Ло")
  hashmap.put(16750, "Сяо Суань")
  hashmap.put(13276, "Сяо Фа")
  hashmap.put(10583, "Сяо Я")
  puts "\nХеш-таблица после вставки:\n[Ключ1 -> Значение1, Ключ2 -> Значение2, ...]"
  hashmap.print

  # Поиск
  # Получить из таблицы значение value по ключу key
  name = hashmap.get(13276)
  puts "\nИмя студента с номером 13276: #{name}"

  # Удаление
  # Удалить из таблицы пару (key, value)
  hashmap.remove(12836)
  puts "\nХеш-таблица после удаления 12836:\n[Ключ1 -> Значение1, Ключ2 -> Значение2, ...]"
  hashmap.print
end
