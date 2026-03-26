=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Подсчетная сортировка ###
def counting_sort_naive(nums)
  # Простая реализация, не может использоваться дляСортировкаобъект
  # 1. Найти максимальный элемент массива m
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. Подсчитать число появлений каждой цифры
  # counter[num] обозначает число появлений num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Обойти counter и записать элементы обратно в исходный массив nums
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

# ## Подсчетная сортировка ###
def counting_sort(nums)
  # Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
  # 1. Найти максимальный элемент массива m
  m = nums.max
  # 2. Подсчитать число появлений каждой цифры
  # counter[num] обозначает число появлений num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Вычислить префиксные суммы counter, преобразовав «число появлений» в «конечный индекс»
  # То есть counter[num]-1 — это индекс последнего появления num в res
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
  # Инициализировать массив res для хранения результата
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # Разместить num в соответствующем индексе
    counter[num] -= 1 # Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
  end
  # Перезаписать исходный массив nums результатом из массива res
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "После сортировки подсчетом nums1 = #{nums1}"
end
