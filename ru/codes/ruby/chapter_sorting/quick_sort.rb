=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Быстрая сортировкакласс ###
class QuickSort
  class << self
    # ## Разбиение методом двух указателей ###
    def partition(nums, left, right)
      # Взять nums[left] в качестве опорного элемента
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Искать справа налево первый элемент, меньший опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Искать слева направо первый элемент, больший опорного
        end
        # Поменять элементы местами
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Быстрая сортировкакласс ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не равна 1
      if left < right
        # Разбиение методом двух указателей
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## Класс быстрой сортировки (оптимизация медианой) ###
class QuickSortMedian
  class << self
    # ## Выбрать медиану из трех кандидатов ###
    def median_three(nums, left, mid, right)
      # Выбрать медиану из трех кандидатов
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m находится между l и r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l находится между m и r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    # ## Разбиение методом двух указателей (медиана трех)###
    def partition(nums, left, right)
      # ## Взять nums[left] в качестве опорного элемента
      med = median_three(nums, left, (left + right) / 2, right)
      # Переместить медиану в самую левую позицию массива
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Искать справа налево первый элемент, меньший опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Искать слева направо первый элемент, больший опорного
        end
        # Поменять элементы местами
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Быстрая сортировка ###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не равна 1
      if left < right
        # Разбиение методом двух указателей
        pivot = partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## Класс быстрой сортировки (оптимизация глубины рекурсии)###
class QuickSortTailCall
  class << self
    # ## Разбиение методом двух указателей ###
    def partition(nums, left, right)
      # Использовать nums[left] как опорный элемент
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Искать справа налево первый элемент, меньший опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Искать слева направо первый элемент, больший опорного
        end
        # Поменять элементы местами
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Переместить опорный элемент на границу двух подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    # ## Быстрая сортировка (оптимизация глубины рекурсии)###
    def quick_sort(nums, left, right)
      # Рекурсивно обрабатывать, пока длина подмассива не равна 1
      while left < right
        # Разбиение методом двух указателей
        pivot = partition(nums, left, right)
        # Выполнить быструю сортировку для более короткого из двух подмассивов
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # Оставшийся неотсортированный диапазон равен [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # Оставшийся неотсортированный диапазон равен [left, pivot - 1]
        end
      end
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Быстрая сортировка
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "После быстрой сортировки nums = #{nums}"

  # Быстрая сортировка (оптимизация с медианным опорным элементом)
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "Быстрая сортировка (оптимизация с медианным опорным элементом)после завершения nums1 = #{nums1}"

  # Быстрая сортировка (оптимизация глубины рекурсии)
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "Быстрая сортировка (оптимизация глубины рекурсии)после завершения nums2 = #{nums2}"
end
