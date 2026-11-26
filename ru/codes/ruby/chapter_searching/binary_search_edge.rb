=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### Двоичный поиск первого вхождения target ###
def binary_search_left_edge(nums, target)
  # Задача равносильна поиску позиции вставки target
  i = binary_search_insertion(nums, target)

  # Значение target не найдено, возвращаем -1
  return -1 if i == nums.length || nums[i] != target

  i # Значение target найдено, возвращаем индекс i
end

### Двоичный поиск последнего вхождения target ###
def binary_search_right_edge(nums, target)
  # Сводим задачу к поиску первого вхождения target + 1
  i = binary_search_insertion(nums, target + 1)

  # j указывает на последнее вхождение target, а i — на первый элемент, больший target
  j = i - 1

  # Значение target не найдено, возвращаем -1
  return -1 if j == -1 || nums[j] != target

  j # Значение target найдено, возвращаем индекс j
end

### Пример использования ###
if __FILE__ == $0
  # Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nМассив nums = #{nums}"

  # Двоичный поиск левой и правой границ
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "Индекс первого вхождения #{target} = #{index}"
    index = binary_search_right_edge(nums, target)
    puts "Индекс последнего вхождения #{target} = #{index}"
  end
end
