=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### Слить левый и правый подмассивы ###
def merge(nums, left, mid, right)
  # Левый подмассив занимает [left, mid], правый — [mid+1, right]
  # Создать временный массив tmp для результата слияния
  tmp = Array.new(right - left + 1, 0)
  # Установить индексы на начало левого и правого подмассивов
  i, j, k = left, mid + 1, 0
  # Пока в обоих подмассивах есть элементы, сравнивать их и копировать меньший во временный массив
  while i <= mid && j <= right
    if nums[i] <= nums[j]
      tmp[k] = nums[i]
      i += 1
    else
      tmp[k] = nums[j]
      j += 1
    end
    k += 1
  end
  # Скопировать оставшиеся элементы подмассивов во временный массив
  while i <= mid
    tmp[k] = nums[i]
    i += 1
    k += 1
  end
  while j <= right
    tmp[k] = nums[j]
    j += 1
    k += 1
  end
  # Скопировать элементы tmp обратно на соответствующий участок nums
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### Сортировка слиянием ###
def merge_sort(nums, left, right)
  # Условие остановки
  # Завершить рекурсию, когда длина подмассива равна 1
  return if left >= right
  # Разбиение
  mid = left + (right - left) / 2 # Вычислить середину
  merge_sort(nums, left, mid) # Рекурсивно отсортировать левый подмассив
  merge_sort(nums, mid + 1, right) # Рекурсивно отсортировать правый подмассив
  # Слияние
  merge(nums, left, mid, right)
end

### Тестовый пример ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "После сортировки слиянием nums = #{nums.inspect}"
end
