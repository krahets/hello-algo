=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Класс быстрой сортировки ###
class QuickSort
  class << self
    ### Разбиение двумя указателями ###
    def partition(nums, left, right)
      # Выбрать nums[left] опорным элементом
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Справа налево найти первый элемент меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Слева направо найти первый элемент больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Обменом поместить опорный элемент на границу подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    ### Класс быстрой сортировки ###
    def quick_sort(nums, left, right)
      # Рекурсивный вызов при длине подмассива, отличной от 1
      if left < right
        # Разбиение двумя указателями
        pivot = partition(nums, left, right)
        # Рекурсивно отсортировать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### Класс быстрой сортировки с выбором медианы###
class QuickSortMedian
  class << self
    ### Выбрать медиану трёх кандидатов ###
    def median_three(nums, left, mid, right)
      # Выбрать медиану трёх кандидатов
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m лежит между l и r
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l лежит между m и r
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### Разбиение двумя указателями с выбором медианы трёх###
    def partition(nums, left, right)
      ### Выбрать nums[left] опорным элементом
      med = median_three(nums, left, (left + right) / 2, right)
      # Обменом поместить медиану в начало массива
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Справа налево найти первый элемент меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Слева направо найти первый элемент больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Обменом поместить опорный элемент на границу подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    ### Быстрая сортировка ###
    def quick_sort(nums, left, right)
      # Рекурсивный вызов при длине подмассива, отличной от 1
      if left < right
        # Разбиение двумя указателями
        pivot = partition(nums, left, right)
        # Рекурсивно отсортировать левый и правый подмассивы
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### Класс быстрой сортировки с уменьшенной глубиной рекурсии###
class QuickSortTailCall
  class << self
    ### Разбиение двумя указателями ###
    def partition(nums, left, right)
      # Выбрать nums[left] опорным элементом
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # Справа налево найти первый элемент меньше опорного
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # Слева направо найти первый элемент больше опорного
        end
        # Обмен элементов
        nums[i], nums[j] = nums[j], nums[i]
      end
      # Обменом поместить опорный элемент на границу подмассивов
      nums[i], nums[left] = nums[left], nums[i]
      i # Вернуть индекс опорного элемента
    end

    ### Быстрая сортировка с уменьшенной глубиной рекурсии###
    def quick_sort(nums, left, right)
      # Рекурсивный вызов при длине подмассива, отличной от 1
      while left < right
        # Разбиение двумя указателями
        pivot = partition(nums, left, right)
        # Применить быструю сортировку к более короткому подмассиву
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # Оставшийся неотсортированный участок: [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # Оставшийся неотсортированный участок: [left, pivot - 1]
        end
      end
    end
  end
end

### Тестовый пример ###
if __FILE__ == $0
  # Быстрая сортировка
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "После быстрой сортировки nums = #{nums}"

  # Быстрая сортировка с выбором медианы в качестве опорного элемента
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "После быстрой сортировки с выбором медианы nums1 = #{nums1}"

  # Быстрая сортировка с уменьшенной глубиной рекурсии
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "После быстрой сортировки с уменьшенной глубиной рекурсии nums2 = #{nums2}"
end
