=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

# ## Бинарный поиск точки вставки (без повторяющихся элементов) ###
def binary_search_insertion_simple(nums, target)
  # Инициализировать двусторонне замкнутый интервал [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Вычислить индекс середины m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target находится в интервале [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target находится в интервале [i, m-1]
    else
      return m  # Найти target и вернуть точку вставки m
    end
  end

  i # target не найден, вернуть точку вставки i
end

# ## Бинарный поиск точки вставки (с повторяющимися элементами) ###
def binary_search_insertion(nums, target)
  # Инициализировать двусторонне замкнутый интервал [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Вычислить индекс середины m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target находится в интервале [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target находится в интервале [i, m-1]
    else
      j = m - 1 # Первый элемент меньше target находится в интервале [i, m-1]
    end
  end

  i # Вернуть точку вставки i
end

### Driver Code ###
if __FILE__ == $0
  # Массив без повторяющихся элементов
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\nМассив nums = #{nums}"
  # Бинарный поиск точки вставки
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "Индекс позиции вставки элемента #{target}: #{index}"
  end

  # Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nМассив nums = #{nums}"
  # Бинарный поиск точки вставки
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "Индекс позиции вставки элемента #{target}: #{index}"
  end
end
