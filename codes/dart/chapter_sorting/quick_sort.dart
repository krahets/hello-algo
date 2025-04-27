/**
 * File: quick_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* 快速排序类 */
class QuickSort {
  /* 元素交换 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 哨兵划分 */
  static int _partition(List<int> nums, int left, int right) {
    // 以 nums[left] 为基准数
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
      while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
      _swap(nums, i, j); // 交换这两个元素
    }
    _swap(nums, i, left); // 将基准数交换至两子数组的分界线
    return i; // 返回基准数的索引
  }

  /* 快速排序 */
  static void quickSort(List<int> nums, int left, int right) {
    // 子数组长度为 1 时终止递归
    if (left >= right) return;
    // 哨兵划分
    int pivot = _partition(nums, left, right);
    // 递归左子数组、右子数组
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* 快速排序类（中位基准数优化） */
class QuickSortMedian {
  /* 元素交换 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 选取三个候选元素的中位数 */
  static int _medianThree(List<int> nums, int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
      return mid; // m 在 l 和 r 之间
    if ((m <= l && l <= r) || (r <= l && l <= m))
      return left; // l 在 m 和 r 之间
    return right;
  }

  /* 哨兵划分（三数取中值） */
  static int _partition(List<int> nums, int left, int right) {
    // 选取三个候选元素的中位数
    int med = _medianThree(nums, left, (left + right) ~/ 2, right);
    // 将中位数交换至数组最左端
    _swap(nums, left, med);
    // 以 nums[left] 为基准数
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
      while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
      _swap(nums, i, j); // 交换这两个元素
    }
    _swap(nums, i, left); // 将基准数交换至两子数组的分界线
    return i; // 返回基准数的索引
  }

  /* 快速排序 */
  static void quickSort(List<int> nums, int left, int right) {
    // 子数组长度为 1 时终止递归
    if (left >= right) return;
    // 哨兵划分
    int pivot = _partition(nums, left, right);
    // 递归左子数组、右子数组
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* 快速排序类（尾递归优化） */
class QuickSortTailCall {
  /* 元素交换 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 哨兵划分 */
  static int _partition(List<int> nums, int left, int right) {
    // 以 nums[left] 为基准数
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 从右向左找首个小于基准数的元素
      while (i < j && nums[i] <= nums[left]) i++; // 从左向右找首个大于基准数的元素
      _swap(nums, i, j); // 交换这两个元素
    }
    _swap(nums, i, left); // 将基准数交换至两子数组的分界线
    return i; // 返回基准数的索引
  }

  /* 快速排序（尾递归优化） */
  static void quickSort(List<int> nums, int left, int right) {
    // 子数组长度为 1 时终止
    while (left < right) {
      // 哨兵划分操作
      int pivot = _partition(nums, left, right);
      // 对两个子数组中较短的那个执行快速排序
      if (pivot - left < right - pivot) {
        quickSort(nums, left, pivot - 1); // 递归排序左子数组
        left = pivot + 1; // 剩余未排序区间为 [pivot + 1, right]
      } else {
        quickSort(nums, pivot + 1, right); // 递归排序右子数组
        right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
      }
    }
  }
}

/* Driver Code */
void main() {
  /* 快速排序 */
  List<int> nums = [2, 4, 1, 0, 3, 5];
  QuickSort.quickSort(nums, 0, nums.length - 1);
  print("快速排序完成后 nums = $nums");

  /* 快速排序（中位基准数优化） */
  List<int> nums1 = [2, 4, 1, 0, 3, 5];
  QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
  print("快速排序（中位基准数优化）完成后 nums1 = $nums1");

  /* 快速排序（尾递归优化） */
  List<int> nums2 = [2, 4, 1, 0, 3, 5];
  QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
  print("快速排序（尾递归优化）完成后 nums2 = $nums2");
}
