/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* 最も左の target を二分探索 */
int binarySearchLeftEdge(List<int> nums, int target) {
  // target の挿入位置を探すのと等価
  int i = binarySearchInsertion(nums, target);
  // target が見つからなければ、-1 を返す
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // target が見つかったら、インデックス i を返す
  return i;
}

/* 最も右の target を二分探索 */
int binarySearchRightEdge(List<int> nums, int target) {
  // 最左の target + 1 を探す問題に変換する
  int i = binarySearchInsertion(nums, target + 1);
  // j は最も右の target を指し、i は target より大きい最初の要素を指す
  int j = i - 1;
  // target が見つからなければ、-1 を返す
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // target が見つかったら、インデックス j を返す
  return j;
}

/* Driver Code */
void main() {
  // 重複要素を含む配列
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n配列 nums = $nums");

  // 二分探索で左端と右端を探す
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("最も左の要素 $target のインデックスは $index です");
    index = binarySearchRightEdge(nums, target);
    print("最も右の要素 $target のインデックスは $index です");
  }
}
