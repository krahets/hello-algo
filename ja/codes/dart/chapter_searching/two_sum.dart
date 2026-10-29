/**
 * File: two_sum.dart
 * Created Time: 2023-2-11
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

/* 方法 1：総当たり列挙 */
List<int> twoSumBruteForce(List<int> nums, int target) {
  int size = nums.length;
  // 二重ループのため、時間計算量は O(n^2)
  for (var i = 0; i < size - 1; i++) {
    for (var j = i + 1; j < size; j++) {
      if (nums[i] + nums[j] == target) return [i, j];
    }
  }
  return [0];
}

/* 方法 2：補助ハッシュテーブル */
List<int> twoSumHashTable(List<int> nums, int target) {
  int size = nums.length;
  // 補助ハッシュテーブルの空間計算量は O(n)
  Map<int, int> dic = HashMap();
  // 一重ループのため、時間計算量は O(n)
  for (var i = 0; i < size; i++) {
    if (dic.containsKey(target - nums[i])) {
      return [dic[target - nums[i]]!, i];
    }
    dic.putIfAbsent(nums[i], () => i);
  }
  return [0];
}

/* 実行用コード */
void main() {
  // ======= テストケース =======
  List<int> nums = [2, 7, 11, 15];
  int target = 13;

  // ====== 実行用コード ======
  // 方法 1
  List<int> res = twoSumBruteForce(nums, target);
  print('方法 1 res = $res');
  // 方法 2
  res = twoSumHashTable(nums, target);
  print('方法 2 res = $res');
}
