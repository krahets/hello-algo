/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* 実行用コード */
void main() {
  /* リストを初期化する */
  List<int> nums = [1, 3, 2, 5, 4];
  print('リスト nums = $nums');

  /* 要素にアクセスする */
  int _num = nums[1];
  print('インデックス 1 の要素にアクセスした結果 _num = $_num');

  /* 要素を更新する */
  nums[1] = 0;
  print('インデックス 1 の要素を 0 に更新した結果 nums = $nums');

  /* リストを空にする */
  nums.clear();
  print('リストを空にした後 nums = $nums');

  /* 末尾に要素を追加する */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('要素を追加した後 nums = $nums');

  /* 途中に要素を挿入する */
  nums.insert(3, 6);
  print('インデックス 3 に数値 6 を挿入した結果 nums = $nums');

  /* 要素を削除する */
  nums.removeAt(3);
  print('インデックス 3 の要素を削除した結果 nums = $nums');

  /* インデックスを使ってリストを走査する */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* リストの要素を直接走査する */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* 2 つのリストを連結する */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('リスト nums の後ろに nums1 を連結した結果 nums = $nums');

  /* リストをソートする */
  nums.sort();
  print('リストをソートした後 nums = $nums');
}
