/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* バブルソート */
void bubbleSort(List<int> nums) {
  // 外側のループ：未整列区間は [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
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

/* バブルソート（フラグによる最適化）*/
void bubbleSortWithFlag(List<int> nums) {
  // 外側のループ：未整列区間は [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // フラグを初期化
    // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // nums[j] と nums[j + 1] を交換
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // 交換があったことを記録
      }
    }
    if (!flag) break; // この走査で交換がなければループを終了
  }
}

/* 実行例 */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("バブルソート後の nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("バブルソート後の nums1 = $nums1");
}
