/**
 * File: two_sum.dart
 * Created Time: 2023-2-11
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

/* 방법 1. 모든 조합 확인 */
List<int> twoSumBruteForce(List<int> nums, int target) {
  int size = nums.length;
  // 이중 반복문을 사용하므로 시간 복잡도는 O(n^2)이다.
  for (var i = 0; i < size - 1; i++) {
    for (var j = i + 1; j < size; j++) {
      if (nums[i] + nums[j] == target) return [i, j];
    }
  }
  return [0];
}

/* 방법 2. 보조 해시 테이블 사용 */
List<int> twoSumHashTable(List<int> nums, int target) {
  int size = nums.length;
  // 보조 해시 테이블을 사용하므로 공간 복잡도는 O(n)이다.
  Map<int, int> dic = HashMap();
  // 반복문 하나만 사용하므로 시간 복잡도는 O(n)이다.
  for (var i = 0; i < size; i++) {
    if (dic.containsKey(target - nums[i])) {
      return [dic[target - nums[i]]!, i];
    }
    dic.putIfAbsent(nums[i], () => i);
  }
  return [0];
}

/* 실행 예제 */
void main() {
  // ======= 테스트 케이스 =======
  List<int> nums = [2, 7, 11, 15];
  int target = 13;

  // ====== 실행 예제 ======
  // 방법 1
  List<int> res = twoSumBruteForce(nums, target);
  print('방법 1 res = $res');
  // 방법 2
  res = twoSumHashTable(nums, target);
  print('방법 2 res = $res');
}
