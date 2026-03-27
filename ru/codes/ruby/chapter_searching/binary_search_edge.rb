=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

# ## Бинарный поиск самого левого target ###
def binary_search_left_edge(nums, target)
  # Эквивалентно поиску точки вставки target
  i = binary_search_insertion(nums, target)

  # target не найден, вернуть -1
  return -1 if i == nums.length || nums[i] != target

  i # Найти target и вернуть индекс i
end

# ## Бинарный поиск самого правого target ###
def binary_search_right_edge(nums, target)
  # Преобразовать задачу в поиск самого левого target + 1
  i = binary_search_insertion(nums, target + 1)

  # j указывает на самый правый target, а i — на первый элемент больше target
  j = i - 1

  # target не найден, вернуть -1
  return -1 if j == -1 || nums[j] != target

  j # Найти target и вернуть индекс j
end

### Driver Code ###
if __FILE__ == $0
  # Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nМассив nums = #{nums}"

  # Бинарный поиск левой и правой границы
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "Индекс крайнего левого элемента #{target}: #{index}"
    index = binary_search_right_edge(nums, target)
    puts "Индекс крайнего правого элемента #{target}: #{index}"
  end
end
