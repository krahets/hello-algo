/**
 * File: binary_search_edge.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 二分查找最左一个元素 */
int binarySearchLeftEdge(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 计算中间索引 m
    if (nums[m] < target)
      i = m + 1; // target 在区间 [m+1, j] 中
    else if (nums[m] > target)
      j = m - 1; // target 在区间 [i, m-1] 中
    else
      j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
  }
  if (i == nums.length || nums[i] != target) return -1; // 未找到目标元素，返回 -1
  return i;
}

/* 二分查找最右一个元素 */
int binarySearchRightEdge(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // 初始化双闭区间 [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 计算中间索引 m
    if (nums[m] < target)
      i = m + 1; // target 在区间 [m+1, j] 中
    else if (nums[m] > target)
      j = m - 1; // target 在区间 [i, m-1] 中
    else
      i = m + 1; // 首个大于 target 的元素在区间 [m+1, j] 中
  }
  if (j < 0 || nums[j] != target) return -1; // 未找到目标元素，返回 -1
  return j;
}

/* Driver Code */
void main() {
  int target = 6;
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];

  // 二分查找最左一个元素
  int indexLeft = binarySearchLeftEdge(nums, target);
  print("数组中最左一个元素 6 的索引 = $indexLeft");
  // 二分查找最右一个元素
  int indexRight = binarySearchRightEdge(nums, target);
  print("数组中最右一个元素 6 的索引 = $indexRight");
}
