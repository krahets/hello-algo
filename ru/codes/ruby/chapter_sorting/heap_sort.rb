=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### Размер кучи равен n. Выполнить просеивание вниз от узла i ###
def sift_down(nums, n, i)
  while true
    # Найти среди i, l, r узел с наибольшим значением и обозначить его ma
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
    break if ma == i
    # Поменять два узла местами
    nums[i], nums[ma] = nums[ma], nums[i]
    # Продолжить просеивание вниз
    i = ma
  end
end

### Пирамидальная сортировка ###
def heap_sort(nums)
  # Построить кучу: выполнить просеивание для всех узлов, кроме листьев
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # Извлечь максимум из кучи n-1 раз
  (nums.length - 1).downto(1) do |i|
    # Обменять корень с крайним правым листом (первый элемент с последним)
    nums[0], nums[i] = nums[i], nums[0]
    # Выполнить просеивание вниз от корня
    sift_down(nums, i, 0)
  end
end

### Тестовый пример ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "После пирамидальной сортировки nums = #{nums.inspect}"
end
