=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 快速排序类 ###
class QuickSort
  class << self
    ### 哨兵划分 ###
    def partition(nums, left, right)
      # 以 nums[left] 为基准数
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 从右向左找首个小于基准数的元素
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 从左向右找首个大于基准数的元素
        end
        # 元素交换
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 将基准数交换至两子数组的分界线
      nums[i], nums[left] = nums[left], nums[i]
      i # 返回基准数的索引
    end

    ### 快速排序类 ###
    def quick_sort(nums, left, right)
      # 子数组长度不为 1 时递归
      if left < right
        # 哨兵划分
        pivot = partition(nums, left, right)
        # 递归左子数组、右子数组
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### 快速排序类（中位数优化）###
class QuickSortMedian
  class << self
    ### 选取三个候选元素的中位数 ###
    def median_three(nums, left, mid, right)
      # 选取三个候选元素的中位数
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m 在 l 和 r 之间
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l 在 m 和 r 之间
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### 哨兵划分（三数取中值）###
    def partition(nums, left, right)
      ### 以 nums[left] 为基准数
      med = median_three(nums, left, (left + right) / 2, right)
      # 将中位数交换至数组最左断
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 从右向左找首个小于基准数的元素
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 从左向右找首个大于基准数的元素
        end
        # 元素交换
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 将基准数交换至两子数组的分界线
      nums[i], nums[left] = nums[left], nums[i]
      i # 返回基准数的索引
    end

    ### 快速排序 ###
    def quick_sort(nums, left, right)
      # 子数组长度不为 1 时递归
      if left < right
        # 哨兵划分
        pivot = partition(nums, left, right)
        # 递归左子数组、右子数组
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### 快速排序类（尾递归优化）###
class QuickSortTailCall
  class << self
    ### 哨兵划分 ###
    def partition(nums, left, right)
      # 以 nums[left]为基准数
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 从右向左找首个小于基准数的元素
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 从左向右找首个大于基准数的元素
        end
        # 元素交换
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 将基准数交换至两子数组的分界线
      nums[i], nums[left] = nums[left], nums[i]
      i # 返回基准数的索引
    end

    ### 快速排序（尾递归优化）###
    def quick_sort(nums, left, right)
      # 子数组长度不为 1 时递归
      while left < right
        # 哨兵划分
        pivot = partition(nums, left, right)
        # 对两个子数组中较短的那个执行快速排序
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 剩余未排序区间为 [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 剩余未排序区间为 [left, pivot - 1]
        end
      end
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 快速排序
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "快速排序完成后 nums = #{nums}"

  # 快速排序（中位基准数优化）
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "快速排序（中位基准数优化）完成后 nums1 = #{nums1}"

  # 快速排序（尾递归优化）
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "快速排序（尾递归优化）完成后 nums2 = #{nums2}"
end
