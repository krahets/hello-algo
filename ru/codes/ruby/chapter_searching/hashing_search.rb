=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

# ## Хеш-поиск (массив) ###
def hashing_search_array(hmap, target)
  # key хеш-таблицы: целевой элемент, value: индекс
  # Если такого key нет в хеш-таблице, вернуть -1
  hmap[target] || -1
end

# ## Хеш-поиск (связный список) ###
def hashing_search_linkedlist(hmap, target)
  # key хеш-таблицы: целевой элемент, value: объект узла
  # Если такого key нет в хеш-таблице, вернуть None
  hmap[target] || nil
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # Хеш-поиск (массив)
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # Инициализация хеш-таблицы
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: элемент, value: индекс
  end
  index = hashing_search_array(map0, target)
  puts "Индекс целевого элемента 3 = #{index}"

  # Хеш-поиск (связный список)
  head = arr_to_linked_list(nums)
  # Инициализация хеш-таблицы
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "Объект узла со значением 3 = #{node}"
end
