/**
 * File: binary_search.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 二分探索（両閉区間） */
int binarySearch(List<int> nums, int target) {
  // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
  int i = 0, j = nums.length - 1;
  // ループし、探索区間が空になったら終了する（i > j で空）
  while (i <= j) {
    int m = i + (j - i) ~/ 2; // 中点インデックス m を計算
    if (nums[m] < target) {
      // この場合、target は区間 [m+1, j] にある
      i = m + 1;
    } else if (nums[m] > target) {
      // この場合、target は区間 [i, m-1] にある
      j = m - 1;
    } else {
      // 目標要素が見つかったらそのインデックスを返す
      return m;
    }
  }
  // 目標要素が見つからなければ -1 を返す
  return -1;
}

/* 二分探索（左閉右開区間） */
int binarySearchLCRO(List<int> nums, int target) {
  // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
  int i = 0, j = nums.length;
  // ループし、探索区間が空になったら終了する（i = j で空）
  while (i < j) {
    int m = i + (j - i) ~/ 2; // 中点インデックス m を計算
    if (nums[m] < target) {
      // この場合、target は区間 [m+1, j) にある
      i = m + 1;
    } else if (nums[m] > target) {
      // この場合、target は区間 [i, m) にある
      j = m;
    } else {
      // 目標要素が見つかったらそのインデックスを返す
      return m;
    }
  }
  // 目標要素が見つからなければ -1 を返す
  return -1;
}

/* Driver Code*/
void main() {
  int target = 6;
  final nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

  /* 二分探索（両閉区間） */
  int index = binarySearch(nums, target);
  print('対象要素 6 のインデックス = $index');

  /* 二分探索（左閉右開区間） */
  index = binarySearchLCRO(nums, target);
  print('対象要素 6 のインデックス = $index');
}
