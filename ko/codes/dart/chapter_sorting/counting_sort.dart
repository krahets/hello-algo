/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* 계수 정렬 */
// 간단한 구현이며, 객체 정렬에는 사용할 수 없다
void countingSortNaive(List<int> nums) {
  // 1. 배열의 최댓값 m을 구한다
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 각 숫자의 등장 횟수를 센다
  // counter[_num]은 _num의 등장 횟수를 나타낸다
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* 계수 정렬 */
// 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
void countingSort(List<int> nums) {
  // 1. 배열의 최댓값 m을 구한다
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 각 숫자의 등장 횟수를 센다
  // counter[_num]은 _num의 등장 횟수를 나타낸다
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
  // 즉, counter[_num]-1은 res에서 _num이 마지막으로 등장하는 인덱스이다
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
  // 결과를 기록할 배열 res를 초기화한다
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // _num을 해당 인덱스에 배치한다
    counter[_num]--; // 접두 합을 1 감소시켜 다음에 _num을 배치할 인덱스를 구한다
  }
  // 결과 배열 res로 원래 배열 nums를 덮어쓴다
  nums.setAll(0, res);
}

/* 실행 코드*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('계수 정렬(객체 정렬 불가) 후 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('계수 정렬 후 nums1 = $nums1');
}
