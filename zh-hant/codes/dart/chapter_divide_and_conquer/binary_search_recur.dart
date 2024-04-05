/**
 * File: binary_search_recur.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 二分搜尋：問題 f(i, j) */
int dfs(List<int> nums, int target, int i, int j) {
  // 若區間為空，代表無目標元素，則返回 -1
  if (i > j) {
    return -1;
  }
  // 計算中點索引 m
  int m = (i + j) ~/ 2;
  if (nums[m] < target) {
    // 遞迴子問題 f(m+1, j)
    return dfs(nums, target, m + 1, j);
  } else if (nums[m] > target) {
    // 遞迴子問題 f(i, m-1)
    return dfs(nums, target, i, m - 1);
  } else {
    // 找到目標元素，返回其索引
    return m;
  }
}

/* 二分搜尋 */
int binarySearch(List<int> nums, int target) {
  int n = nums.length;
  // 求解問題 f(0, n-1)
  return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
void main() {
  int target = 6;
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

  // 二分搜尋（雙閉區間）
  int index = binarySearch(nums, target);
  print("目標元素 6 的索引 = $index");
}
