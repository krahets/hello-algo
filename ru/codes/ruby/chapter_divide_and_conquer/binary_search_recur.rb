=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Бинарный поиск: задача f(i, j) ###
def dfs(nums, target, i, j)
  # Если интервал пуст, целевой элемент отсутствует, вернуть -1
  return -1 if i > j
  
  # Вычислить индекс середины m
  m = (i + j) / 2

  if nums[m] < target
    # Рекурсивная подзадача f(m+1, j)
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # Рекурсивная подзадача f(i, m-1)
    return dfs(nums, target, i, m - 1)
  else
    # Целевой элемент найден, вернуть его индекс
    return m
  end
end

# ## Бинарный поиск ###
def binary_search(nums, target)
  n = nums.length
  # Решить задачу f(0, n-1)
  dfs(nums, target, 0, n - 1)
end

### Driver Code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Бинарный поиск (двусторонне замкнутый интервал)
  index = binary_search(nums, target)
  puts "Индекс целевого элемента 6 = #{index}"
end
