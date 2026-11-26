/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 임의의 원소에 접근 */
int randomAccess(List<int> nums) {
  // 구간 [0, nums.length)에서 수 하나를 무작위로 선택
  int randomIndex = Random().nextInt(nums.length);
  // 선택한 원소를 가져와 반환
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 배열 길이 늘리기 */
List<int> extend(List<int> nums, int enlarge) {
  // 길이를 늘린 새 배열 초기화
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 원래 배열의 모든 원소를 새 배열에 복사
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 길이를 늘린 새 배열 반환
  return res;
}

/* 배열의 인덱스 index에 원소 _num 삽입 */
void insert(List<int> nums, int _num, int index) {
  // 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // 인덱스 index의 원소에 _num 대입
  nums[index] = _num;
}

/* 인덱스 index의 원소 삭제 */
void remove(List<int> nums, int index) {
  // 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 배열 원소 순회 */
void traverse(List<int> nums) {
  int count = 0;
  // 인덱스로 배열 순회
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 배열 원소를 직접 순회
  for (int _num in nums) {
    count += _num;
  }
  // forEach 메서드로 배열 순회
  nums.forEach((_num) {
    count += _num;
  });
}

/* 배열에서 지정한 원소 찾기 */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* 실행 예제 */
void main() {
  /* 배열 초기화 */
  var arr = List.filled(5, 0);
  print('배열 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('배열 nums = $nums');

  /* 임의 접근 */
  int randomNum = randomAccess(nums);
  print('nums에서 무작위로 선택한 원소: $randomNum');

  /* 길이 늘리기 */
  nums = extend(nums, 3);
  print('길이를 8로 늘린 배열 nums = $nums');

  /* 원소 삽입 */
  insert(nums, 6, 3);
  print("인덱스 3에 숫자 6을 삽입한 후 nums = $nums");

  /* 원소 삭제 */
  remove(nums, 2);
  print("인덱스 2의 원소를 삭제한 후 nums = $nums");

  /* 배열 순회 */
  traverse(nums);

  /* 원소 찾기 */
  int index = find(nums, 3);
  print("nums에서 원소 3을 찾은 인덱스 = $index");
}
