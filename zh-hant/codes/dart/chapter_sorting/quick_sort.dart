/**
 * File: quick_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* 快速排序類別 */
class QuickSort {
  /* 元素交換 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 哨兵劃分 */
  static int _partition(List<int> nums, int left, int right) {
    // 以 nums[left] 為基準數
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 從右向左找首個小於基準數的元素
      while (i < j && nums[i] <= nums[left]) i++; // 從左向右找首個大於基準數的元素
      _swap(nums, i, j); // 交換這兩個元素
    }
    _swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
    return i; // 返回基準數的索引
  }

  /* 快速排序 */
  static void quickSort(List<int> nums, int left, int right) {
    // 子陣列長度為 1 時終止遞迴
    if (left >= right) return;
    // 哨兵劃分
    int pivot = _partition(nums, left, right);
    // 遞迴左子陣列、右子陣列
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* 快速排序類別（中位基準數最佳化） */
class QuickSortMedian {
  /* 元素交換 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 選取三個候選元素的中位數 */
  static int _medianThree(List<int> nums, int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
      return mid; // m 在 l 和 r 之間
    if ((m <= l && l <= r) || (r <= l && l <= m))
      return left; // l 在 m 和 r 之間
    return right;
  }

  /* 哨兵劃分（三數取中值） */
  static int _partition(List<int> nums, int left, int right) {
    // 選取三個候選元素的中位數
    int med = _medianThree(nums, left, (left + right) ~/ 2, right);
    // 將中位數交換至陣列最左端
    _swap(nums, left, med);
    // 以 nums[left] 為基準數
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 從右向左找首個小於基準數的元素
      while (i < j && nums[i] <= nums[left]) i++; // 從左向右找首個大於基準數的元素
      _swap(nums, i, j); // 交換這兩個元素
    }
    _swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
    return i; // 返回基準數的索引
  }

  /* 快速排序 */
  static void quickSort(List<int> nums, int left, int right) {
    // 子陣列長度為 1 時終止遞迴
    if (left >= right) return;
    // 哨兵劃分
    int pivot = _partition(nums, left, right);
    // 遞迴左子陣列、右子陣列
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* 快速排序類別（尾遞迴最佳化） */
class QuickSortTailCall {
  /* 元素交換 */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* 哨兵劃分 */
  static int _partition(List<int> nums, int left, int right) {
    // 以 nums[left] 為基準數
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // 從右向左找首個小於基準數的元素
      while (i < j && nums[i] <= nums[left]) i++; // 從左向右找首個大於基準數的元素
      _swap(nums, i, j); // 交換這兩個元素
    }
    _swap(nums, i, left); // 將基準數交換至兩子陣列的分界線
    return i; // 返回基準數的索引
  }

  /* 快速排序（尾遞迴最佳化） */
  static void quickSort(List<int> nums, int left, int right) {
    // 子陣列長度為 1 時終止
    while (left < right) {
      // 哨兵劃分操作
      int pivot = _partition(nums, left, right);
      // 對兩個子陣列中較短的那個執行快速排序
      if (pivot - left < right - pivot) {
        quickSort(nums, left, pivot - 1); // 遞迴排序左子陣列
        left = pivot + 1; // 剩餘未排序區間為 [pivot + 1, right]
      } else {
        quickSort(nums, pivot + 1, right); // 遞迴排序右子陣列
        right = pivot - 1; // 剩餘未排序區間為 [left, pivot - 1]
      }
    }
  }
}

/* Driver Code */
void main() {
  /* 快速排序 */
  List<int> nums = [2, 4, 1, 0, 3, 5];
  QuickSort.quickSort(nums, 0, nums.length - 1);
  print("快速排序完成後 nums = $nums");

  /* 快速排序（中位基準數最佳化） */
  List<int> nums1 = [2, 4, 1, 0, 3, 5];
  QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
  print("快速排序（中位基準數最佳化）完成後 nums1 = $nums1");

  /* 快速排序（尾遞迴最佳化） */
  List<int> nums2 = [2, 4, 1, 0, 3, 5];
  QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
  print("快速排序（尾遞迴最佳化）完成後 nums2 = $nums2");
}
