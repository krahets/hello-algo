/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // 배열 원소를 무작위로 섞는다
  nums.shuffle();

  return nums;
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
    // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* 실행 코드 */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\n배열 [ 1, 2, ..., n ]을 섞은 후 = $nums');
    print('숫자 1의 인덱스 = + $index');
  }
}
