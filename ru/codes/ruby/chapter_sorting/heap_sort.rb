=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

# ## Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз ###
def sift_down(nums, n, i)
  while true
    # Определить узел с максимальным значением среди i, l и r и обозначить его как ma
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
    break if ma == i
    # Поменять местами два узла
    nums[i], nums[ma] = nums[ma], nums[i]
    # Циклически выполнять просеивание вниз
    i = ma
  end
end

# ## Сортировка кучей ###
def heap_sort(nums)
  # Построение кучи: выполнить просеивание для всех узлов, кроме листьев
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # Извлекать максимальный элемент из кучи в течение n-1 итераций
  (nums.length - 1).downto(1) do |i|
    # Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
    nums[0], nums[i] = nums[i], nums[0]
    # Начиная с корневого узла, выполнить просеивание сверху вниз
    sift_down(nums, i, 0)
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "Сортировка кучейпосле завершения nums = #{nums.inspect}"
end
