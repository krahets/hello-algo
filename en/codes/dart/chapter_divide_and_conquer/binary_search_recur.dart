/**
 * File: binary_search_recur.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Binary search: problem f(i, j) */
int dfs(List<int> nums, int target, int i, int j) {
  // An empty interval contains no target, so return -1
  if (i > j) {
    return -1;
  }
  // Compute the middle index m
  int m = (i + j) ~/ 2;
  if (nums[m] < target) {
    // Recursively solve f(m+1, j)
    return dfs(nums, target, m + 1, j);
  } else if (nums[m] > target) {
    // Recursively solve f(i, m-1)
    return dfs(nums, target, i, m - 1);
  } else {
    // Target found: return its index
    return m;
  }
}

/* Binary search */
int binarySearch(List<int> nums, int target) {
  int n = nums.length;
  // Solve f(0, n-1)
  return dfs(nums, target, 0, n - 1);
}

/* Driver code */
void main() {
  int target = 6;
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

  // Binary search (closed interval)
  int index = binarySearch(nums, target);
  print("Index of target 6 = $index");
}
