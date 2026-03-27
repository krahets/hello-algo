=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Пузырьковая сортировка ###
def bubble_sort(nums)
  n = nums.length
  # Внешний цикл: неотсортированный диапазон [0, i]
  for i in (n - 1).downto(1)
    # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Поменять местами nums[j] и nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

# ## Пузырьковая сортировка (оптимизация флагом) ###
def bubble_sort_with_flag(nums)
  n = nums.length
  # Внешний цикл: неотсортированный диапазон [0, i]
  for i in (n - 1).downto(1)
    flag = false # Инициализировать флаг

    # Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Поменять местами nums[j] и nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # Записать обмен элементов
      end
    end

    break unless flag # На этой итерации «всплытия» не было ни одного обмена, сразу выйти
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "После пузырьковой сортировки nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "После пузырьковой сортировки nums = #{nums1}"
end
