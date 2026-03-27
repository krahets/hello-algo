=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Случайный доступ к элементу ###
def random_access(nums)
  # Случайным образом выбрать число из интервала [0, nums.length)
  random_index = Random.rand(0...nums.length)

  # Получить и вернуть случайный элемент
  nums[random_index]
end


# ## Увеличить длину массива ###
# Обратите внимание: Array в Ruby является динамическим массивом и может быть расширен напрямую
# Для удобства обучения эта функция рассматривает Array как массив неизменяемой длины
def extend(nums, enlarge)
  # Инициализировать массив увеличенной длины
  res = Array.new(nums.length + enlarge, 0)

  # Скопировать все элементы исходного массива в новый массив
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # Вернуть новый массив после расширения
  res
end

# ## Вставка элемента num по индексу index в массив ###
def insert(nums, num, index)
  # Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # Присвоить num элементу по индексу index
  nums[index] = num
end


# ## Удаление элемента по индексу index ###
def remove(nums, index)
  # Сдвинуть все элементы после индекса index на одну позицию вперед
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

# ## Обход массива ###
def traverse(nums)
  count = 0

  # Обход массива по индексам
  for i in 0...nums.length
    count += nums[i]
  end

  # Непосредственно обходить элементы массива
  for num in nums
    count += num
  end
end

# ## Поиск заданного элемента в массиве ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # Инициализация массива
  arr = Array.new(5, 0)
  puts "Массив arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "Массив nums = #{nums}"

  # Случайный доступ
  random_num = random_access(nums)
  puts "Случайный элемент из nums = #{random_num}"

  # Расширение длины
  nums = extend(nums, 3)
  puts "После увеличения длины массива до 8 nums = #{nums}"

  # Вставка элемента
  insert(nums, 6, 3)
  puts "После вставки числа 6 по индексу 3 nums = #{nums}"

  # Удаление элемента
  remove(nums, 2)
  puts "После удаления элемента по индексу 2 nums = #{nums}"

  # Обход массива
  traverse(nums)

  # Поиск элемента
  index = find(nums, 3)
  puts "Поиск элемента 3 в nums: индекс = #{index}"
end
