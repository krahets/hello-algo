/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* 계수 정렬 */
// 객체를 정렬할 수 없는 간단한 구현
void countingSortNaive(List<int> nums) {
  // 1. 배열의 최댓값 m 구하기
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 각 숫자의 출현 횟수 세기
  // counter[_num]은 _num의 출현 횟수
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* 계수 정렬 */
// 객체도 정렬할 수 있는 안정 정렬의 전체 구현
void countingSort(List<int> nums) {
  // 1. 배열의 최댓값 m 구하기
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 각 숫자의 출현 횟수 세기
  // counter[_num]은 _num의 출현 횟수
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
  // 즉, counter[_num]-1은 res에서 _num이 마지막으로 나타나는 인덱스
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
  // 결과를 기록할 배열 res 초기화
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // _num을 해당 인덱스에 배치
    counter[_num]--; // 누적합을 1 줄여 다음 _num을 배치할 인덱스 구하기
  }
  // 결과 배열 res로 원래 배열 nums를 덮어쓰기
  nums.setAll(0, res);
}

/* 실행 예제*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('계수 정렬(객체 정렬 불가) 후 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('계수 정렬 후 nums1 = $nums1');
}
