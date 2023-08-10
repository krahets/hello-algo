/**
 * File: binary_search_recur.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 二分查找：问题 f(i, j) */
int dfs(List<int> nums, int target, int i, int j) {
  // 若区间为空，代表无目标元素，则返回 -1
  if (i > j) {
    return -1;
  }
  // 计算中点索引 m
  int m = (i + j) ~/ 2;
  if (nums[m] < target) {
    // 递归子问题 f(m+1, j)
    return dfs(nums, target, m + 1, j);
  } else if (nums[m] > target) {
    // 递归子问题 f(i, m-1)
    return dfs(nums, target, i, m - 1);
  } else {
    // 找到目标元素，返回其索引
    return m;
  }
}

/* 二分查找 */
int binarySearch(List<int> nums, int target) {
  int n = nums.length;
  // 求解问题 f(0, n-1)
  return dfs(nums, target, 0, n - 1);
}

/* Driver Code */
void main() {
  int target = 6;
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

  // 二分查找（双闭区间）
  int index = binarySearch(nums, target);
  print("目标元素 6 的索引 = $index");
}
