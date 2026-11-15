=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализация списка
  nums = [1, 3, 2, 5, 4]
  puts "Список nums = #{nums}"

  # [region]{access_element}
  # Доступ к элементу
  num = nums[1] # Доступ к элементу по индексу 1
  # [endregion]{access_element}
  puts "Элемент по индексу 1: num = #{num}"

  # [region]{update_element}
  # Изменение элемента
  nums[1] = 0 # Изменить значение элемента с индексом 1 на 0
  # [endregion]{update_element}
  puts "После изменения значения элемента с индексом 1 на 0 nums = #{nums}"

  # [region]{clear_list}
  # Очистить список
  nums.clear
  # [endregion]{clear_list}
  puts "После очистки списка nums = #{nums}"

  # [region]{append_element}
  # Добавление элемента в конец
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  # [endregion]{append_element}
  puts "После добавления элементов nums = #{nums}"

  # [region]{insert_element}
  # Вставка элемента в середину
  nums.insert(3, 6) # Вставить число 6 по индексу 3
  # [endregion]{insert_element}
  puts "После вставки элемента 6 по индексу 3 nums = #{nums}"

  # [region]{remove_element}
  # Удаление элемента
  nums.delete_at(3) # Удалить элемент по индексу 3
  # [endregion]{remove_element}
  puts "После удаления элемента по индексу 3 nums = #{nums}"

  # [region]{iterate_list}
  # Обходить список по индексам
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # Непосредственно обходить элементы списка
  count = 0
  nums.each do |x|
    count += x
  end
  # [endregion]{iterate_list}

  # [region]{concat_list}
  # Объединить два списка
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  # [endregion]{concat_list}
  puts "После конкатенации списка nums1 к nums nums = #{nums}"

  # [region]{sort_list}
  # Отсортировать список
  nums = nums.sort { |a, b| a <=> b } # После сортировки элементы списка идут по возрастанию
  # [endregion]{sort_list}
  puts "После сортировки списка nums = #{nums}"
end
