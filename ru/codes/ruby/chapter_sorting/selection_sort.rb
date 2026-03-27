=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Сортировка выбором ###
def selection_sort(nums)
  n = nums.length
  # Внешний цикл: неотсортированный диапазон [i, n-1]
  for i in 0...(n - 1)
    # Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # Записать индекс минимального элемента
      end
    end
    # Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "После сортировки выбором nums = #{nums}"
end
