/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* バブルソート */
void bubbleSort(List<int> nums) {
  // 外側のループ：未ソート区間は [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // nums[j] と nums[j + 1] を交換する
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
      }
    }
  }
}

/* バブルソート（フラグによる最適化）*/
void bubbleSortWithFlag(List<int> nums) {
  // 外側のループ：未ソート区間は [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // フラグを初期化する
    // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // nums[j] と nums[j + 1] を交換する
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // 要素を交換したことを記録する
      }
    }
    if (!flag) break; // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
  }
}

/* 実行用コード */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("バブルソート完了後 nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("バブルソート完了後 nums1 = $nums1");
}
