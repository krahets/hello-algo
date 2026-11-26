=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### Поиск по хеш-таблице в массиве ###
def hashing_search_array(hmap, target)
  # Ключ хеш-таблицы — искомый элемент, значение — его индекс
  # Если ключа в хеш-таблице нет, возвращаем -1
  hmap[target] || -1
end

### Поиск по хеш-таблице в связном списке ###
def hashing_search_linkedlist(hmap, target)
  # Ключ хеш-таблицы — искомый элемент, значение — объект узла
  # Если ключа в хеш-таблице нет, возвращаем None
  hmap[target] || nil
end

### Пример использования ###
if __FILE__ == $0
  target = 3

  # Поиск по хеш-таблице в массиве
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # Создаём хеш-таблицу
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # Ключ — элемент, значение — индекс
  end
  index = hashing_search_array(map0, target)
  puts "Индекс элемента 3 = #{index}"

  # Поиск по хеш-таблице в связном списке
  head = arr_to_linked_list(nums)
  # Создаём хеш-таблицу
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "Узел со значением 3: #{node}"
end
