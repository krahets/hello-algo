/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* Counting sort */
// Simple implementation that cannot sort objects
void countingSortNaive(List<int> nums) {
  // 1. Find the largest array element m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Count the occurrences of each number
  // counter[_num] holds the number of occurrences of _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Traverse counter and write each value back into nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* Counting sort */
// Full implementation that can sort objects and is stable
void countingSort(List<int> nums) {
  // 1. Find the largest array element m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Count the occurrences of each number
  // counter[_num] holds the number of occurrences of _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Compute prefix sums in counter to locate the last position for each value
  // That is, counter[_num]-1 is the last index of _num in res
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. Traverse nums backward and place each element in the result array res
  // Initialize the result array res
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // Place _num at its corresponding index
    counter[_num]--; // Decrement the prefix sum by 1 to find the next index for _num
  }
  // Copy res back into the original array nums
  nums.setAll(0, res);
}

/* Driver Code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('After counting sort (values only), nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('After counting sort, nums1 = $nums1');
}
