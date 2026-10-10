/**
 * File: quick_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Quick sort class */
class QuickSort {
  /* Swap elements */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* Sentinel partition */
  static int _partition(List<int> nums, int left, int right) {
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
      while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
      _swap(nums, i, j); // Swap these two elements
    }
    _swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
    return i; // Return the index of the pivot
  }

  /* Quick sort */
  static void quickSort(List<int> nums, int left, int right) {
    // Terminate recursion when subarray length is 1
    if (left >= right) return;
    // Sentinel partition
    int pivot = _partition(nums, left, right);
    // Recursively process the left subarray and right subarray
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* Quick sort class (median pivot optimization) */
class QuickSortMedian {
  /* Swap elements */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* Select the median of three candidate elements */
  static int _medianThree(List<int> nums, int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
      return mid; // m is between l and r
    if ((m <= l && l <= r) || (r <= l && l <= m))
      return left; // l is between m and r
    return right;
  }

  /* Sentinel partition (median of three) */
  static int _partition(List<int> nums, int left, int right) {
    // Select the median of three candidate elements
    int med = _medianThree(nums, left, (left + right) ~/ 2, right);
    // Swap the median to the array's leftmost position
    _swap(nums, left, med);
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
      while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
      _swap(nums, i, j); // Swap these two elements
    }
    _swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
    return i; // Return the index of the pivot
  }

  /* Quick sort */
  static void quickSort(List<int> nums, int left, int right) {
    // Terminate recursion when subarray length is 1
    if (left >= right) return;
    // Sentinel partition
    int pivot = _partition(nums, left, right);
    // Recursively process the left subarray and right subarray
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* Quick sort class (recursion depth optimization) */
class QuickSortTailCall {
  /* Swap elements */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* Sentinel partition */
  static int _partition(List<int> nums, int left, int right) {
    // Use nums[left] as the pivot
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // Search from right to left for the first element smaller than the pivot
      while (i < j && nums[i] <= nums[left]) i++; // Search from left to right for the first element greater than the pivot
      _swap(nums, i, j); // Swap these two elements
    }
    _swap(nums, i, left); // Swap the pivot to the boundary between the two subarrays
    return i; // Return the index of the pivot
  }

  /* Quick sort (recursion depth optimization) */
  static void quickSort(List<int> nums, int left, int right) {
    // Terminate when subarray length is 1
    while (left < right) {
      // Sentinel partition operation
      int pivot = _partition(nums, left, right);
      // Perform quick sort on the shorter of the two subarrays
      if (pivot - left < right - pivot) {
        quickSort(nums, left, pivot - 1); // Recursively sort the left subarray
        left = pivot + 1; // Remaining unsorted interval is [pivot + 1, right]
      } else {
        quickSort(nums, pivot + 1, right); // Recursively sort the right subarray
        right = pivot - 1; // Remaining unsorted interval is [left, pivot - 1]
      }
    }
  }
}

/* Driver Code */
void main() {
  /* Quick sort */
  List<int> nums = [2, 4, 1, 0, 3, 5];
  QuickSort.quickSort(nums, 0, nums.length - 1);
  print("After quick sort, nums = $nums");

  /* Quick sort (recursion depth optimization) */
  List<int> nums1 = [2, 4, 1, 0, 3, 5];
  QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
  print("After quick sort (median pivot optimization), nums1 = $nums1");

  /* Quick sort (recursion depth optimization) */
  List<int> nums2 = [2, 4, 1, 0, 3, 5];
  QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
  print("After quick sort (recursion depth optimization), nums2 = $nums2");
}
