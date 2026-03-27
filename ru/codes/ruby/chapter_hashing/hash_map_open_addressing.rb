=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

# ## Хеш-таблица с открытой адресацией ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # Удалить метку

  # ## Конструктор ###
  def initialize
    @size = 0 # Число пар ключ-значение
    @capacity = 4 # Вместимость хеш-таблицы
    @load_thres = 2.0 / 3.0 # Порог коэффициента загрузки для запуска расширения
    @extend_ratio = 2 # Коэффициент расширения
    @buckets = Array.new(@capacity) # Массив корзин
  end

  # ## Хеш-функция ###
  def hash_func(key)
    key % @capacity
  end

  # ## Коэффициент загрузки ###
  def load_factor
    @size / @capacity
  end

  # ## Найти индекс корзины, соответствующий key ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # Выполнять линейное пробирование и завершить при встрече с пустой корзиной
    while !@buckets[index].nil?
      # Если встретился key, вернуть соответствующий индекс корзины
      if @buckets[index].key == key
        # Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # Вернуть индекс корзины после перемещения
        end
        return index # Вернуть индекс корзины
      end
      # Записать первую встретившуюся метку удаления
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # Вычислить индекс корзины; при выходе за конец вернуться к началу
      index = (index + 1) % @capacity
    end
    # Если key не существует, вернуть индекс точки добавления
    first_tombstone == -1 ? index : first_tombstone
  end

  # ## Операция поиска ###
  def get(key)
    # Найти индекс корзины, соответствующий key
    index = find_bucket(key)
    # Если пара ключ-значение найдена, вернуть соответствующее val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # Если пара ключ-значение не существует, вернуть nil
    nil
  end

  # ## Операция добавления ###
  def put(key, val)
    # Когда коэффициент загрузки превышает порог, выполнить расширение
    extend if load_factor > @load_thres
    # Найти индекс корзины, соответствующий key
    index = find_bucket(key)
    # Если пара ключ-значение найдена, перезаписать val и вернуть
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # Если пары ключ-значение нет, добавить ее
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  # ## Операция удаления ###
  def remove(key)
    # Найти индекс корзины, соответствующий key
    index = find_bucket(key)
    # Если пара ключ-значение найдена, заменить ее меткой удаления
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  # ## Расширение хеш-таблицы ###
  def extend
    # Временно сохранить исходную хеш-таблицу
    buckets_tmp = @buckets
    # Инициализация новой хеш-таблицы после расширения
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # Перенести пары ключ-значение из исходной хеш-таблицы в новую
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  # ## Вывести хеш-таблицу ###
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

### Driver Code ###
if __FILE__ == $0
  # Инициализация хеш-таблицы
  hashmap = HashMapOpenAddressing.new

  # Операция добавления
  # Добавить пару (key, val) в хеш-таблицу
  hashmap.put(12836, "Сяо Ха")
  hashmap.put(15937, "Сяо Ло")
  hashmap.put(16750, "Сяо Суань")
  hashmap.put(13276, "Сяо Фа")
  hashmap.put(10583, "Сяо Я")
  puts "\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение"
  hashmap.print

  # Операция поиска
  # Передать ключ key в хеш-таблицу и получить значение val
  name = hashmap.get(13276)
  puts "\nДля номера 13276 найдено имя #{name}"

  # Операция удаления
  # Удалить пару (key, val) из хеш-таблицы
  hashmap.remove(16750)
  puts "\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение"
  hashmap.print
end
