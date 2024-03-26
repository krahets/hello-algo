/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // 生成陣列 nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // 隨機打亂陣列元素
  nums.shuffle();

  return nums;
}

/* 查詢陣列 nums 中數字 1 所在索引 */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
    // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Driver Code */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\n陣列 [ 1, 2, ..., n ] 被打亂後 = $nums');
    print('數字 1 的索引為 + $index');
  }
}
