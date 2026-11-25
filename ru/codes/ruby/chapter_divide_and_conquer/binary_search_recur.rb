=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Двоичный поиск: задача f(i, j) ###
def dfs(nums, target, i, j)
  # Если интервал пуст, искомого элемента нет. Возвращаем -1
  return -1 if i > j
  
  # Вычисляем индекс середины m
  m = (i + j) / 2

  if nums[m] < target
    # Рекурсивно решаем подзадачу f(m+1, j)
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # Рекурсивно решаем подзадачу f(i, m-1)
    return dfs(nums, target, i, m - 1)
  else
    # Искомый элемент найден. Возвращаем его индекс
    return m
  end
end

### Двоичный поиск ###
def binary_search(nums, target)
  n = nums.length
  # Решаем задачу f(0, n-1)
  dfs(nums, target, 0, n - 1)
end

### Основная программа ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Двоичный поиск (замкнутый интервал)
  index = binary_search(nums, target)
  puts "Индекс элемента 6 = #{index}"
end
