/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* バブルソート */
void bubbleSort(List<int> nums) {
  // 外側のループ：未ソート区間は [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // nums[j] と nums[j + 1] を交換
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
      }
    }
  }
}

/* バブルソート（フラグ最適化） */
void bubbleSortWithFlag(List<int> nums) {
  // 外側のループ：未ソート区間は [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // フラグを初期化する
    // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // nums[j] と nums[j + 1] を交換
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // 交換する要素を記録
      }
    }
    if (!flag) break; // このバブル処理で要素交換が一度もなければそのまま終了
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("バブルソート完了後 nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("バブルソート完了後 nums1 = $nums1");
}
