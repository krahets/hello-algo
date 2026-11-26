=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 快速排序類別 ###
class QuickSort
  class << self
    ### 哨兵分割 ###
    def partition(nums, left, right)
      # 以 nums[left] 為基準值
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 從右向左尋找第一個小於基準值的元素
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 從左向右尋找第一個大於基準值的元素
        end
        # 交換元素
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 交換元素，將基準值移到兩個子陣列的交界處
      nums[i], nums[left] = nums[left], nums[i]
      i # 回傳基準值的索引
    end

    ### 快速排序類別 ###
    def quick_sort(nums, left, right)
      # 子陣列長度不等於 1 時繼續遞迴
      if left < right
        # 哨兵分割
        pivot = partition(nums, left, right)
        # 遞迴處理左、右子陣列
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### 快速排序類別（以中位數最佳化）###
class QuickSortMedian
  class << self
    ### 取三個候選元素的中位數 ###
    def median_three(nums, left, mid, right)
      # 取三個候選元素的中位數
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m 介於 l 和 r 之間
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l 介於 m 和 r 之間
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### 哨兵分割（三數取中）###
    def partition(nums, left, right)
      ### 以 nums[left] 為基準值
      med = median_three(nums, left, (left + right) / 2, right)
      # 將中位數與陣列最左端的元素交換
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 從右向左尋找第一個小於基準值的元素
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 從左向右尋找第一個大於基準值的元素
        end
        # 交換元素
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 交換元素，將基準值移到兩個子陣列的交界處
      nums[i], nums[left] = nums[left], nums[i]
      i # 回傳基準值的索引
    end

    ### 快速排序 ###
    def quick_sort(nums, left, right)
      # 子陣列長度不等於 1 時繼續遞迴
      if left < right
        # 哨兵分割
        pivot = partition(nums, left, right)
        # 遞迴處理左、右子陣列
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### 快速排序類別（遞迴深度最佳化）###
class QuickSortTailCall
  class << self
    ### 哨兵分割 ###
    def partition(nums, left, right)
      # 以 nums[left] 為基準值
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 從右向左尋找第一個小於基準值的元素
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 從左向右尋找第一個大於基準值的元素
        end
        # 交換元素
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 交換元素，將基準值移到兩個子陣列的交界處
      nums[i], nums[left] = nums[left], nums[i]
      i # 回傳基準值的索引
    end

    ### 快速排序（遞迴深度最佳化）###
    def quick_sort(nums, left, right)
      # 子陣列長度不等於 1 時繼續遞迴
      while left < right
        # 哨兵分割
        pivot = partition(nums, left, right)
        # 對兩個子陣列中較短的一個執行快速排序
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 剩餘的未排序區間為 [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 剩餘的未排序區間為 [left, pivot - 1]
        end
      end
    end
  end
end

### 主程式 ###
if __FILE__ == $0
  # 快速排序
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "快速排序完成後 nums = #{nums}"

  # 快速排序（以中位數作為基準值的最佳化）
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "快速排序（以中位數作為基準值的最佳化）完成後 nums1 = #{nums1}"

  # 快速排序（遞迴深度最佳化）
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "快速排序（遞迴深度最佳化）完成後 nums2 = #{nums2}"
end
