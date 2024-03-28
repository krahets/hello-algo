/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* 二分搜尋最左一個 target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // 等價於查詢 target 的插入點
  int i = binarySearchInsertion(nums, target);
  // 未找到 target ，返回 -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // 找到 target ，返回索引 i
  return i;
}

/* 二分搜尋最右一個 target */
int binarySearchRightEdge(List<int> nums, int target) {
  // 轉化為查詢最左一個 target + 1
  int i = binarySearchInsertion(nums, target + 1);
  // j 指向最右一個 target ，i 指向首個大於 target 的元素
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
  // 包含重複元素的陣列
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n陣列 nums = $nums");

  // 二分搜尋左邊界和右邊界
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("最左一個元素 $target 的索引為 $index");
    index = binarySearchRightEdge(nums, target);
    print("最右一個元素 $target 的索引為 $index");
  }
}
