/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* Counting sort */
// Simple implementation; cannot be used to sort objects
void countingSortNaive(List<int> nums) {
  // 1. Find the maximum array element m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Count the occurrences of each number
  // counter[_num] is the number of occurrences of _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Traverse counter and fill the original array nums with the elements
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* Counting sort */
// Full stable implementation; this approach can be adapted to sort objects
void countingSort(List<int> nums) {
  // 1. Find the maximum array element m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Count the occurrences of each number
  // counter[_num] is the number of occurrences of _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Compute prefix sums of counter to convert occurrence counts into end positions
  // That is, counter[_num]-1 is the index of the last occurrence of _num in res
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. Traverse nums in reverse and place each element in the result array res
  // Initialize array res to store the result
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // Place _num at the corresponding index
    counter[_num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of _num
  }
  // Overwrite the original array nums with the result array res
  nums.setAll(0, res);
}

/* Driver code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('After counting sort (cannot sort objects), nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('After counting sort, nums1 = $nums1');
}
