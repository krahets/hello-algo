=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Сортировка выбором ###
def selection_sort(nums)
  n = nums.length
  # Внешний цикл: неотсортированный участок [i, n-1]
  for i in 0...(n - 1)
    # Внутренний цикл: найти минимум неотсортированного участка
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # Запомнить индекс минимума
      end
    end
    # Поменять минимум местами с первым элементом неотсортированного участка
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### Тестовый пример ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "После сортировки выбором nums = #{nums}"
end
