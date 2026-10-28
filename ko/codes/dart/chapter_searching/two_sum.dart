/**
 * File: two_sum.dart
 * Created Time: 2023-2-11
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

/* 방법 1: 완전 열거 */
List<int> twoSumBruteForce(List<int> nums, int target) {
  int size = nums.length;
  // 이중 반복문이며 시간 복잡도는 O(n^2)이다
  for (var i = 0; i < size - 1; i++) {
    for (var j = i + 1; j < size; j++) {
      if (nums[i] + nums[j] == target) return [i, j];
    }
  }
  return [0];
}

/* 방법 2: 보조 해시 테이블 */
List<int> twoSumHashTable(List<int> nums, int target) {
  int size = nums.length;
  // 보조 해시 테이블의 공간 복잡도는 O(n)이다
  Map<int, int> dic = HashMap();
  // 단일 반복문이며 시간 복잡도는 O(n)이다
  for (var i = 0; i < size; i++) {
    if (dic.containsKey(target - nums[i])) {
      return [dic[target - nums[i]]!, i];
    }
    dic.putIfAbsent(nums[i], () => i);
  }
  return [0];
}

/* 실행 코드 */
void main() {
  // ======= 테스트 사례 =======
  List<int> nums = [2, 7, 11, 15];
  int target = 13;

  // ====== 실행 코드 ======
  // 방법 1
  List<int> res = twoSumBruteForce(nums, target);
  print('방법 1 res = $res');
  // 방법 2
  res = twoSumHashTable(nums, target);
  print('방법 2 res = $res');
}
