=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Чтение случайного элемента ###
def random_access(nums)
  # Выбрать случайное число из интервала [0, nums.length)
  random_index = Random.rand(0...nums.length)

  # Получить и вернуть случайный элемент
  nums[random_index]
end


### Увеличение длины массива ###
# В Ruby Array — динамический массив, который можно расширять напрямую
# В этом учебном примере функция рассматривает Array как массив фиксированной длины
def extend(nums, enlarge)
  # Создать массив увеличенной длины
  res = Array.new(nums.length + enlarge, 0)

  # Скопировать все элементы исходного массива в новый
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # Вернуть новый массив увеличенной длины
  res
end

### Вставить num в массив по индексу index ###
def insert(nums, num, index)
  # Сдвинуть на одну позицию вправо все элементы начиная с index
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # Записать num по индексу index
  nums[index] = num
end


### Удалить элемент по индексу index ###
def remove(nums, index)
  # Сдвинуть все элементы после index на одну позицию влево
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### Обход массива ###
def traverse(nums)
  count = 0

  # Обойти массив по индексам
  for i in 0...nums.length
    count += nums[i]
  end

  # Перебрать элементы массива напрямую
  for num in nums
    count += num
  end
end

### Поиск заданного элемента в массиве ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Демонстрационный код ###
if __FILE__ == $0
  # Инициализация массива
  arr = Array.new(5, 0)
  puts "Массив arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "Массив nums = #{nums}"

  # Чтение случайного элемента
  random_num = random_access(nums)
  puts "Случайный элемент nums: #{random_num}"

  # Увеличение длины
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
  puts "Индекс элемента 3 в nums = #{index}"
end
