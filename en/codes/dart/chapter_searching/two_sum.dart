/**
 * File: two_sum.dart
 * Created Time: 2023-2-11
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

/* Method 1: Brute force enumeration */
List<int> twoSumBruteForce(List<int> nums, int target) {
  int size = nums.length;
  // Two nested loops, time complexity is O(n^2)
  for (var i = 0; i < size - 1; i++) {
    for (var j = i + 1; j < size; j++) {
      if (nums[i] + nums[j] == target) return [i, j];
    }
  }
  return [0];
}

/* Method 2: Auxiliary hash table */
List<int> twoSumHashTable(List<int> nums, int target) {
  int size = nums.length;
  // Auxiliary hash table, space complexity is O(n)
  Map<int, int> dic = HashMap();
  // Single loop, time complexity is O(n)
  for (var i = 0; i < size; i++) {
    if (dic.containsKey(target - nums[i])) {
      return [dic[target - nums[i]]!, i];
    }
    dic.putIfAbsent(nums[i], () => i);
  }
  return [0];
}

/* Driver Code */
void main() {
  // ======= Test Case =======
  List<int> nums = [2, 7, 11, 15];
  int target = 13;

  // ====== Driver Code ======
  // Method 1
  List<int> res = twoSumBruteForce(nums, target);
  print('Method 1 res = $res');
  // Method 2
  res = twoSumHashTable(nums, target);
  print('Method 2 res = $res');
}
