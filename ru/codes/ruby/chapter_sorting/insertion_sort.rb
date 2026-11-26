=begin
File: insertion_sort.rb
Created Time: 2024-04-02
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Сортировка вставками ###
def insertion_sort(nums)
  n = nums.length
  # Внешний цикл: отсортированный участок [0, i-1]
  for i in 1...n
    base = nums[i]
    j = i - 1
    # Внутренний цикл: вставить base на своё место в участке [0, i-1]
    while j >= 0 && nums[j] > base
      nums[j + 1] = nums[j] # Сдвинуть nums[j] на одну позицию вправо
      j -= 1
    end
    nums[j + 1] = base # Записать base на нужную позицию
  end
end

### Тестовый пример ###
nums = [4, 1, 3, 1, 5, 2]
insertion_sort(nums)
puts "После сортировки вставками nums = #{nums}"
