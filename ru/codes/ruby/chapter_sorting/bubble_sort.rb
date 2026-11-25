=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Сортировка пузырьком ###
def bubble_sort(nums)
  n = nums.length
  # Внешний цикл: неотсортированный участок [0, i]
  for i in (n - 1).downto(1)
    # Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Поменять местами nums[j] и nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### Сортировка пузырьком с флагом обмена###
def bubble_sort_with_flag(nums)
  n = nums.length
  # Внешний цикл: неотсортированный участок [0, i]
  for i in (n - 1).downto(1)
    flag = false # Инициализировать флаг

    # Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Поменять местами nums[j] и nums[j + 1]
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # Отметить, что произошёл обмен
      end
    end

    break unless flag # За этот проход обменов не было. Выйти из цикла
  end
end

### Тестовый пример ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "После сортировки пузырьком nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "После сортировки пузырьком nums = #{nums1}"
end
