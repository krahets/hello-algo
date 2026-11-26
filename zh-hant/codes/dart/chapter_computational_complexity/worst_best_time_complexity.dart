/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // 建立陣列 nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // 隨機打亂陣列元素
  nums.shuffle();

  return nums;
}

/* 在陣列 nums 中尋找數字 1 的索引 */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
    // 若 1 在陣列末端，最差時間複雜度為 O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* 主程式 */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\n陣列 [ 1, 2, ..., n ] 打亂順序後 = $nums');
    print('數字 1 的索引為 $index');
  }
}
