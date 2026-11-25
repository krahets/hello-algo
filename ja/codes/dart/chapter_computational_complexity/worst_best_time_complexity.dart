/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* { 1, 2, ..., n } の要素をランダムに並べた配列を生成 */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // 配列 nums = { 1, 2, 3, ..., n } を生成
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // 配列の要素をシャッフル
  nums.shuffle();

  return nums;
}

/* 配列 nums で数値 1 のインデックスを探す */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
    // 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* 実行例 */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\n配列 [ 1, 2, ..., n ] のシャッフル結果 = $nums');
    print('数値 1 のインデックスは + $index');
  }
}
