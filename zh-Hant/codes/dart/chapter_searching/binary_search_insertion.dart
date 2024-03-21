/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 二分搜尋插入點（無重複元素） */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 計算中點索引 m
    if (nums[m] < target) {
      i = m + 1; // target 在區間 [m+1, j] 中
    } else if (nums[m] > target) {
      j = m - 1; // target 在區間 [i, m-1] 中
    } else {
      return m; // 找到 target ，返回插入點 m
    }
  }
  // 未找到 target ，返回插入點 i
  return i;
}

/* 二分搜尋插入點（存在重複元素） */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // 初始化雙閉區間 [0, n-1]
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 計算中點索引 m
    if (nums[m] < target) {
      i = m + 1; // target 在區間 [m+1, j] 中
    } else if (nums[m] > target) {
      j = m - 1; // target 在區間 [i, m-1] 中
    } else {
      j = m - 1; // 首個小於 target 的元素在區間 [i, m-1] 中
    }
  }
  // 返回插入點 i
  return i;
}

/* Driver Code */
void main() {
  // 無重複元素的陣列
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\n陣列 nums = $nums");
  // 二分搜尋插入點
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("元素 $target 的插入點的索引為 $index");
  }

  // 包含重複元素的陣列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n陣列 nums = $nums");
  // 二分搜尋插入點
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("元素 $target 的插入點的索引為 $index");
  }
}
