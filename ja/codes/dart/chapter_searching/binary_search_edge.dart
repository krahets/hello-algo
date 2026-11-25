/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* 最も左にある target の二分探索 */
int binarySearchLeftEdge(List<int> nums, int target) {
  // target の挿入位置を探すことと同じ
  int i = binarySearchInsertion(nums, target);
  // target が見つからなかったので -1 を返す
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // target が見つかったのでインデックス i を返す
  return i;
}

/* 最も右にある target の二分探索 */
int binarySearchRightEdge(List<int> nums, int target) {
  // 最も左にある target + 1 の探索に置き換える
  int i = binarySearchInsertion(nums, target + 1);
  // j は最も右の target を、i は target より大きい最初の要素を指す
  int j = i - 1;
  // target が見つからなかったので -1 を返す
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // target が見つかったのでインデックス j を返す
  return j;
}

/* 実行例 */
void main() {
  // 重複する要素がある配列
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n配列 nums = $nums");

  // 左端と右端の二分探索
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("最も左にある $target のインデックスは $index");
    index = binarySearchRightEdge(nums, target);
    print("最も右にある $target のインデックスは $index");
  }
}
