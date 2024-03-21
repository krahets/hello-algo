/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // 生成数组 nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // 随机打乱数组元素
  nums.shuffle();

  return nums;
}

/* 查找数组 nums 中数字 1 所在索引 */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
    // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
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
    print('\n数组 [ 1, 2, ..., n ] 被打乱后 = $nums');
    print('数字 1 的索引为 + $index');
  }
}
