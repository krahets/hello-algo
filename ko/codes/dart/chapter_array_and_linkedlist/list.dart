/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* 실행 코드 */
void main() {
  /* 리스트 초기화 */
  List<int> nums = [1, 3, 2, 5, 4];
  print('리스트 nums = $nums');

  /* 원소 접근 */
  int _num = nums[1];
  print('인덱스 1의 원소에 접근한 결과 _num = $_num');

  /* 원소 갱신 */
  nums[1] = 0;
  print('인덱스 1의 원소를 0으로 갱신한 후 nums = $nums');

  /* 리스트 비우기 */
  nums.clear();
  print('리스트를 비운 후 nums = $nums');

  /* 맨 뒤에 원소 추가 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('원소를 추가한 후 nums = $nums');

  /* 중간에 원소 삽입 */
  nums.insert(3, 6);
  print('인덱스 3에 숫자 6을 삽입한 후 nums = $nums');

  /* 원소 삭제 */
  nums.removeAt(3);
  print('인덱스 3의 원소를 삭제한 후 nums = $nums');

  /* 인덱스를 통해 리스트를 순회한다 */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* 리스트의 원소를 직접 순회한다 */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* 두 리스트 연결 */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('리스트 nums 뒤에 nums1을 연결한 후 nums = $nums');

  /* 리스트 정렬 */
  nums.sort();
  print('리스트를 정렬한 후 nums = $nums');
}
