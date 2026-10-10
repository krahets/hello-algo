/**
 * File: insertion_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* 挿入ソート */
void insertionSort(List<int> nums) {
  // 外側ループ：整列済み区間は [0, i-1]
  for (int i = 1; i < nums.length; i++) {
    int base = nums[i], j = i - 1;
    // 内側ループ: base をソート済み区間 [0, i-1] の正しい位置に挿入する
    while (j >= 0 && nums[j] > base) {
      nums[j + 1] = nums[j]; // nums[j] を 1 つ右へ移動する
      j--;
    }
    nums[j + 1] = base; // base を正しい位置に配置する
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  insertionSort(nums);
  print("挿入ソート完了後 nums = $nums");
}
