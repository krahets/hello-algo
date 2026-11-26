/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // 배열 nums = { 1, 2, 3, ..., n }을 만든다
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // 배열의 원소를 무작위로 섞는다
  nums.shuffle();

  return nums;
}

/* 배열 nums에서 1의 인덱스를 찾는다 */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
    // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* 실행 예제 */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\n배열 [ 1, 2, ..., n ]을 섞은 결과 = $nums');
    print('숫자 1의 인덱스 = $index');
  }
}
