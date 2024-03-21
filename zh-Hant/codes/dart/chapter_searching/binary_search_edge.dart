/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* 二分查找最左一个 target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // 等价于查找 target 的插入点
  int i = binarySearchInsertion(nums, target);
  // 未找到 target ，返回 -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // 找到 target ，返回索引 i
  return i;
}

/* 二分查找最右一个 target */
int binarySearchRightEdge(List<int> nums, int target) {
  // 转化为查找最左一个 target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j 指向最右一个 target ，i 指向首个大于 target 的元素
  int j = i - 1;
  // 未找到 target ，返回 -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // 找到 target ，返回索引 j
  return j;
}

/* Driver Code */
void main() {
  // 包含重复元素的数组
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n数组 nums = $nums");

  // 二分查找左边界和右边界
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("最左一个元素 $target 的索引为 $index");
    index = binarySearchRightEdge(nums, target);
    print("最右一个元素 $target 的索引为 $index");
  }
}
