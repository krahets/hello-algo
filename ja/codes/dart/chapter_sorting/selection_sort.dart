/**
 * File: selection_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 選択ソート */
void selectionSort(List<int> nums) {
  int n = nums.length;
  // 外側ループ：未整列区間は [i, n-1]
  for (int i = 0; i < n - 1; i++) {
    // 内側のループ：未ソート区間の最小要素を見つける
    int k = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[k]) k = j; // 最小要素のインデックスを記録
    }
    // その最小要素を未整列区間の先頭要素と交換する
    int temp = nums[i];
    nums[i] = nums[k];
    nums[k] = temp;
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  selectionSort(nums);
  print("選択ソート完了後 nums = $nums");
}
