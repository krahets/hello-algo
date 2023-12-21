/**
 * File: two_sum.dart
 * Created Time: 2023-2-11
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

/* 方法一： 暴力枚举 */
List<int> twoSumBruteForce(List<int> nums, int target) {
  int size = nums.length;
  // 两层循环，时间复杂度为 O(n^2)
  for (var i = 0; i < size - 1; i++) {
    for (var j = i + 1; j < size; j++) {
      if (nums[i] + nums[j] == target) return [i, j];
    }
  }
  return [0];
}

/* 方法二： 辅助哈希表 */
List<int> twoSumHashTable(List<int> nums, int target) {
  int size = nums.length;
  // 辅助哈希表，空间复杂度为 O(n)
  Map<int, int> dic = HashMap();
  // 单层循环，时间复杂度为 O(n)
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
  // 方法一
  List<int> res = twoSumBruteForce(nums, target);
  print('方法一 res = $res');
  // 方法二
  res = twoSumHashTable(nums, target);
  print('方法二 res = $res');
}
