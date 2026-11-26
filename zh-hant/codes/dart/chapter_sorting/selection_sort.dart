/**
 * File: selection_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 選擇排序 */
void selectionSort(List<int> nums) {
  int n = nums.length;
  // 外層迴圈：未排序區間為 [i, n-1]
  for (int i = 0; i < n - 1; i++) {
    // 內層迴圈：找出未排序區間中的最小元素
    int k = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[k]) k = j; // 記錄最小元素的索引
    }
    // 將最小元素與未排序區間的第一個元素交換
    int temp = nums[i];
    nums[i] = nums[k];
    nums[k] = temp;
  }
}

/* 主程式 */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  selectionSort(nums);
  print("選擇排序完成後 nums = $nums");
}
