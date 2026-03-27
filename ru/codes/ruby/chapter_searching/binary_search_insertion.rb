=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

# ## Бинарный поиск точки вставки (без повторяющихся элементов) ###
def binary_search_insertion_simple(nums, target)
  # Инициализировать закрытый интервал [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Вычислить средний индекс m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target находится в интервале [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target находится в интервале [i, m-1]
    else
      return m  # Найти target и вернуть точку вставки m
    end
  end

  i # Если target не найден, вернуть точку вставки i
end

# ## Бинарный поиск точки вставки (при наличии повторяющихся элементов) ###
def binary_search_insertion(nums, target)
  # Инициализировать закрытый интервал [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Вычислить средний индекс m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target находится в интервале [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target находится в интервале [i, m-1]
    else
      j = m - 1 # Первый элемент, меньший target, находится в интервале [i, m-1]
    end
  end

  i # Вернуть точку вставки i
end

### Driver Code ###
if __FILE__ == $0
  # Массив без повторяющихся элементов
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\nМассив nums = #{nums}"
  # Найти точку вставки бинарным поиском
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "Индекс точки вставки элемента #{target} равен #{index}"
  end

  # Массив с повторяющимися элементами
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nМассив nums = #{nums}"
  # Найти точку вставки бинарным поиском
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "Индекс точки вставки элемента #{target} равен #{index}"
  end
end
