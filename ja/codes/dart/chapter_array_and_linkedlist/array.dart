/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 要素にランダムアクセスする */
int randomAccess(List<int> nums) {
  // 区間 [0, nums.length) から数値をランダムに 1 つ選ぶ
  int randomIndex = Random().nextInt(nums.length);
  // ランダムに選んだ要素を取得して返す
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 配列の長さを拡張する */
List<int> extend(List<int> nums, int enlarge) {
  // 拡張後の長さの配列を初期化する
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 元の配列の全要素を新しい配列にコピーする
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 拡張後の新しい配列を返す
  return res;
}

/* 配列のインデックス index に要素 _num を挿入する */
void insert(List<int> nums, int _num, int index) {
  // インデックス index 以降の全要素を 1 つ後ろにずらす
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // インデックス index の要素に _num を代入する
  nums[index] = _num;
}

/* インデックス index の要素を削除する */
void remove(List<int> nums, int index) {
  // インデックス index より後の全要素を 1 つ前にずらす
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* 配列の要素を走査する */
void traverse(List<int> nums) {
  int count = 0;
  // インデックスを使って配列を走査する
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // 配列の要素を直接走査する
  for (int _num in nums) {
    count += _num;
  }
  // forEach メソッドで配列を走査する
  nums.forEach((_num) {
    count += _num;
  });
}

/* 配列から指定した要素を探索する */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* 実行用コード */
void main() {
  /* 配列を初期化する */
  var arr = List.filled(5, 0);
  print('配列 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('配列 nums = $nums');

  /* ランダムアクセス */
  int randomNum = randomAccess(nums);
  print('nums からランダムに取得した要素 $randomNum');

  /* 長さの拡張 */
  nums = extend(nums, 3);
  print('配列の長さを 8 に拡張した結果 nums = $nums');

  /* 要素を挿入する */
  insert(nums, 6, 3);
  print("インデックス 3 に数値 6 を挿入した結果 nums = $nums");

  /* 要素を削除する */
  remove(nums, 2);
  print("インデックス 2 の要素を削除した結果 nums = $nums");

  /* 配列を走査する */
  traverse(nums);

  /* 要素を探索する */
  int index = find(nums, 3);
  print("nums から要素 3 を探索した結果のインデックス = $index");
}
