/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 要素へランダムアクセス */
int randomAccess(List<int> nums) {
  // 区間 [0, nums.length) からランダムに 1 つの数を選ぶ
  int randomIndex = Random().nextInt(nums.length);
  // ランダムな要素を取得して返す
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 配列長を拡張する */
List<int> extend(List<int> nums, int enlarge) {
  // 拡張後の長さを持つ配列を初期化する
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 元の配列の全要素を新しい配列にコピー
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 拡張後の新しい配列を返す
  return res;
}

/* 配列の添字 index に要素 _num を挿入 */
void insert(List<int> nums, int _num, int index) {
  // インデックス index 以降の全要素を 1 つ後ろへ移動する
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // _num を index の位置の要素に代入
  nums[index] = _num;
}

/* index の要素を削除する */
void remove(List<int> nums, int index) {
  // インデックス index より後ろの全要素を 1 つ前へ移動する
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 配列要素を走査する */
void traverse(List<int> nums) {
  int count = 0;
  // インデックスで配列を走査
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 配列要素を直接走査
  for (int _num in nums) {
    count += _num;
  }
  // forEach メソッドで配列を走査する
  nums.forEach((_num) {
    count += _num;
  });
}

/* 配列内で指定要素を探す */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* 配列を初期化 */
  var arr = List.filled(5, 0);
  print('配列 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('配列 nums = $nums');

  /* ランダムアクセス */
  int randomNum = randomAccess(nums);
  print('nums からランダムな要素 $randomNum を取得');

  /* 長さを拡張 */
  nums = extend(nums, 3);
  print('配列の長さを 8 に拡張し、nums = $nums を取得');

  /* 要素を挿入する */
  insert(nums, 6, 3);
  print("インデックス 3 に数字 6 を挿入し、nums = $nums を取得");

  /* 要素を削除 */
  remove(nums, 2);
  print("インデックス 2 の要素を削除し、nums = $nums を取得");

  /* 配列を走査 */
  traverse(nums);

  /* 要素を探索する */
  int index = find(nums, 3);
  print("nums で要素 3 を検索し、インデックス = $index を取得");
}
