=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

# ## Слияние левого и правого подмассивов ###
def merge(nums, left, mid, right)
  # Интервал левого подмассива: [left, mid], правого подмассива: [mid+1, right]
  # Создать временный массив tmp для хранения результата слияния
  tmp = Array.new(right - left + 1, 0)
  # Инициализировать начальные индексы левого и правого подмассивов
  i, j, k = left, mid + 1, 0
  # Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
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
  # Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
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
  # Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

# ## Сортировка слиянием ###
def merge_sort(nums, left, right)
  # Условие завершения
  # Когда длина подмассива равна 1, рекурсия завершается
  return if left >= right
  # Этап разбиения
  mid = left + (right - left) / 2 # Вычислить середину
  merge_sort(nums, left, mid) # Рекурсивно обработать левый подмассив
  merge_sort(nums, mid + 1, right) # Рекурсивно обработать правый подмассив
  # Этап слияния
  merge(nums, left, mid, right)
end

### Driver Code ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "После сортировки слиянием nums = #{nums.inspect}"
end
