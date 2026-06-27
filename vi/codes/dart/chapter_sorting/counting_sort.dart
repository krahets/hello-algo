/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
void countingSortNaive(List<int> nums) {
  // 1. Count the maximum element m in the array
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Count the occurrence of each number
  // counter[_num] represents occurrence count of _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Traverse counter, filling each element back into the original array nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
void countingSort(List<int> nums) {
  // 1. Count the maximum element m in the array
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Count the occurrence of each number
  // counter[_num] represents occurrence count of _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
  // That is, counter[_num]-1 is the last occurrence index of _num in res
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. Traverse nums in reverse order, placing each element into the result array res
  // Initialize the array res to record results
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // Place _num at corresponding index
    counter[_num]--; // Decrement prefix sum by 1 to get next placement index for _num
  }
  // Use result array res to overwrite the original array nums
  nums.setAll(0, res);
}

/* Driver Code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('After counting sort (cannot sort objects), nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('After counting sort, nums1 = $nums1');
}
