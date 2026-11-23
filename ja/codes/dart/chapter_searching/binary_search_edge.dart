/**
 * File: binary_search_edge.dart
 * Created Time: 2023-08-14
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'binary_search_insertion.dart';

/* 二分探索で最も左にある target を探す */
int binarySearchLeftEdge(List<int> nums, int target) {
  // target の挿入位置を探すことに等しい
  int i = binarySearchInsertion(nums, target);
  // target が見つからなかったので、-1 を返す
  if (i == nums.length || nums[i] != target) {
    return -1;
  }
  // target が見つかったので、インデックス i を返す
  return i;
}

/* 二分探索で最も右にある target を探す */
int binarySearchRightEdge(List<int> nums, int target) {
  // 最も左にある target + 1 を探す問題に変換する
  int i = binarySearchInsertion(nums, target + 1);
  // j は最も右にある target を指し、i は target より大きい最初の要素を指す
  int j = i - 1;
  // target が見つからなかったので、-1 を返す
  if (j == -1 || nums[j] != target) {
    return -1;
  }
  // target が見つかったので、インデックス j を返す
  return j;
}

/* 実行用コード */
void main() {
  // 重複要素を含む配列
  List<int> nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
  print("\n配列 nums = $nums");

  // 二分探索で左境界と右境界を求める
  for (int target in [6, 7]) {
    int index = binarySearchLeftEdge(nums, target);
    print("最も左にある要素 $target のインデックスは $index");
    index = binarySearchRightEdge(nums, target);
    print("最も右にある要素 $target のインデックスは $index");
  }
}
