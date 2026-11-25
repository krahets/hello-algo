=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Двоичный поиск позиции вставки без повторов ###
def binary_search_insertion_simple(nums, target)
  # Задаём замкнутый интервал [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Вычисляем индекс середины m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Ищем target в интервале [m+1, j]
    elsif nums[m] > target
      j = m - 1 # Ищем target в интервале [i, m-1]
    else
      return m  # Значение target найдено, возвращаем позицию вставки m
    end
  end

  i # Значение target не найдено, возвращаем позицию вставки i
end

### Двоичный поиск позиции вставки при наличии повторов ###
def binary_search_insertion(nums, target)
  # Задаём замкнутый интервал [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Вычисляем индекс середины m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Ищем target в интервале [m+1, j]
    elsif nums[m] > target
      j = m - 1 # Ищем target в интервале [i, m-1]
    else
      j = m - 1 # В интервале [i, m-1] ищем последний элемент, меньший target
    end
  end

  i # Возвращаем позицию вставки i
end

### Пример использования ###
if __FILE__ == $0
  # Массив без повторяющихся элементов
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\nМассив nums = #{nums}"
  # Двоичный поиск позиции вставки
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "Позиция вставки элемента #{target} = #{index}"
  end

  # Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nМассив nums = #{nums}"
  # Двоичный поиск позиции вставки
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "Позиция вставки элемента #{target} = #{index}"
  end
end
