/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 원소에 임의 접근 */
int randomAccess(List<int> nums) {
  // 구간 [0, nums.length)에서 숫자 하나를 무작위로 뽑는다
  int randomIndex = Random().nextInt(nums.length);
  // 무작위 원소를 가져와 반환한다
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 배열 길이 확장 */
List<int> extend(List<int> nums, int enlarge) {
  // 길이를 확장한 배열을 초기화한다
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 원래 배열의 모든 원소를 새 배열에 복사한다
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 확장한 새 배열을 반환한다
  return res;
}

/* 배열의 인덱스 index에 원소 _num 삽입 */
void insert(List<int> nums, int _num, int index) {
  // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // 인덱스 index의 원소에 _num을 대입한다
  nums[index] = _num;
}

/* 인덱스 index에 있는 원소 삭제 */
void remove(List<int> nums, int index) {
  // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 배열 원소 순회 */
void traverse(List<int> nums) {
  int count = 0;
  // 인덱스를 통해 배열을 순회한다
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 배열의 원소를 직접 순회한다
  for (int _num in nums) {
    count += _num;
  }
  // forEach 메서드로 배열을 순회한다
  nums.forEach((_num) {
    count += _num;
  });
}

/* 배열에서 지정한 원소 탐색 */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* 실행 코드 */
void main() {
  /* 배열 초기화 */
  var arr = List.filled(5, 0);
  print('배열 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('배열 nums = $nums');

  /* 임의 접근 */
  int randomNum = randomAccess(nums);
  print('nums에서 무작위로 가져온 원소 = $randomNum');

  /* 길이 확장 */
  nums = extend(nums, 3);
  print('배열 길이를 8로 확장한 후 nums = $nums');

  /* 원소 삽입 */
  insert(nums, 6, 3);
  print("인덱스 3에 숫자 6을 삽입한 후 nums = $nums");

  /* 원소 삭제 */
  remove(nums, 2);
  print("인덱스 2의 원소를 삭제한 후 nums = $nums");

  /* 배열 순회 */
  traverse(nums);

  /* 원소 탐색 */
  int index = find(nums, 3);
  print("nums에서 원소 3을 찾은 인덱스 = $index");
}
