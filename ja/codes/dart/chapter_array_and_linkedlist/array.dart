/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* 要素にランダムにアクセスする */
int randomAccess(List<int> nums) {
  // 区間 [0, nums.length) から数をランダムに選ぶ
  int randomIndex = Random().nextInt(nums.length);
  // ランダムに選んだ要素を取得して返す
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* 配列の長さを増やす */
List<int> extend(List<int> nums, int enlarge) {
  // 長さを増やした配列を初期化する
  List<int> res = List.filled(nums.length + enlarge, 0);
  // 元の配列の全要素を新しい配列にコピーする
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // 長さを増やした新しい配列を返す
  return res;
}

/* 配列のインデックス index に要素 _num を挿入する */
void insert(List<int> nums, int _num, int index) {
  // インデックス index 以降の全要素を後ろに 1 つずらす
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // インデックス index の要素に _num を代入する
  nums[index] = _num;
}

/* インデックス index の要素を削除する */
void remove(List<int> nums, int index) {
  // インデックス index より後ろの全要素を前に 1 つずらす
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

/* 配列から指定した要素を探す */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* ドライバコード */
void main() {
  /* 配列を初期化する */
  var arr = List.filled(5, 0);
  print('配列 arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('配列 nums = $nums');

  /* ランダムアクセス */
  int randomNum = randomAccess(nums);
  print('nums からランダムに選んだ要素：$randomNum');

  /* 配列の長さを増やす */
  nums = extend(nums, 3);
  print('配列の長さを 8 に増やした後の nums = $nums');

  /* 要素を挿入する */
  insert(nums, 6, 3);
  print("インデックス 3 に 6 を挿入した後の nums = $nums");

  /* 要素を削除する */
  remove(nums, 2);
  print("インデックス 2 の要素を削除した後の nums = $nums");

  /* 配列を走査する */
  traverse(nums);

  /* 要素を探す */
  int index = find(nums, 3);
  print("nums で要素 3 が見つかったインデックス = $index");
}
