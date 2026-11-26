=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Сортировка подсчётом ###
def counting_sort_naive(nums)
  # Простая реализация, непригодная для сортировки объектов
  # 1. Найти максимальный элемент m в массиве
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. Подсчитать число вхождений каждого значения
  # counter[num] — число вхождений num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Пройти по counter и записать элементы в исходный массив nums
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### Сортировка подсчётом ###
def counting_sort(nums)
  # Полная реализация: устойчивая сортировка с поддержкой объектов
  # 1. Найти максимальный элемент m в массиве
  m = nums.max
  # 2. Подсчитать число вхождений каждого значения
  # counter[num] — число вхождений num
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
  # То есть counter[num]-1 — индекс последнего вхождения num в res
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
  # Создать массив res для результата
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # Поместить num по соответствующему индексу
    counter[num] -= 1 # Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
  end
  # Скопировать результат из res в исходный массив nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Тестовый пример ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "После сортировки подсчётом (без поддержки объектов) nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "После сортировки подсчётом nums1 = #{nums1}"
end
