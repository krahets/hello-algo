/**
 * File: binary_search_insertion.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 挿入位置の二分探索（重複する要素がない場合） */
int binarySearchInsertionSimple(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] で初期化する
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 中央のインデックス m を求める
    if (nums[m] < target) {
      i = m + 1; // target の探索範囲は [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // target の探索範囲は [i, m-1]
    } else {
      return m; // target が見つかったので挿入位置 m を返す
    }
  }
  // target が見つからなかったので挿入位置 i を返す
  return i;
}

/* 挿入位置の二分探索（重複する要素がある場合） */
int binarySearchInsertion(List<int> nums, int target) {
  int i = 0, j = nums.length - 1; // 閉区間 [0, n-1] で初期化する
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 中央のインデックス m を求める
    if (nums[m] < target) {
      i = m + 1; // target の探索範囲は [m+1, j]
    } else if (nums[m] > target) {
      j = m - 1; // target の探索範囲は [i, m-1]
    } else {
      j = m - 1; // target 未満の最も右の要素を [i, m-1] で探す
    }
  }
  // 挿入位置 i を返す
  return i;
}

/* 実行例 */
void main() {
  // 重複する要素がない配列
  List<int> nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
  print("\n配列 nums = $nums");
  // 挿入位置の二分探索
  for (int target in [6, 9]) {
    int index = binarySearchInsertionSimple(nums, target);
    print("要素 $target の挿入位置のインデックスは $index");
  }

  // 重複する要素がある配列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n配列 nums = $nums");
  // 挿入位置の二分探索
  for (int target in [2, 6, 20]) {
    int index = binarySearchInsertion(nums, target);
    print("要素 $target の挿入位置のインデックスは $index");
  }
}
