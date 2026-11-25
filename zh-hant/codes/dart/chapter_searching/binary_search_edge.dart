/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* 用二分搜尋找最左邊的 target */
int binarySearchLeftEdge(List<int> nums, int target) {
  // 等同於搜尋 target 的插入點
  int i = binarySearchInsertion(nums, target);
  // 找不到 target，回傳 -1
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // 找到 target，回傳索引 i
  return i;
}

/* 用二分搜尋找最右邊的 target */
int binarySearchRightEdge(List<int> nums, int target) {
  // 改為搜尋 target + 1 的最左插入位置
  int i = binarySearchInsertion(nums, target + 1);
  // j 指向最右邊的 target，i 指向第一個大於 target 的元素
  int j = i - 1;
  // 找不到 target，回傳 -1
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // 找到 target，回傳索引 j
  return j;
}

/* 主程式 */
void main() {
  // 含有重複元素的陣列
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n陣列 nums = $nums");

  // 用二分搜尋找左界和右界
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("最左邊的元素 $target 的索引為 $index");
    index = binarySearchRightEdge(nums, target);
    print("最右邊的元素 $target 的索引為 $index");
  }
}
