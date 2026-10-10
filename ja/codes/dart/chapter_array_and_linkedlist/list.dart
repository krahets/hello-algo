/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  /* リストを初期化 */
  List<int> nums = [1, 3, 2, 5, 4];
  print('リスト nums = $nums');

  /* 要素にアクセス */
  int _num = nums[1];
  print('インデックス 1 の要素にアクセスし、_num = $_num を取得');

  /* 要素を更新 */
  nums[1] = 0;
  print('インデックス 1 の要素を 0 に更新し、nums = $nums を取得');

  /* リストを空にする */
  nums.clear();
  print('リストを空にした後 nums = $nums');

  /* 末尾に要素を追加 */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('要素を追加した後 nums = $nums');

  /* 中間に要素を挿入 */
  nums.insert(3, 6);
  print('インデックス 3 に数字 6 を挿入し、nums = $nums を取得');

  /* 要素を削除 */
  nums.removeAt(3);
  print('インデックス 3 の要素を削除し、nums = $nums を取得');

  /* インデックスでリストを走査 */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* リスト要素を直接走査 */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* 2 つのリストを連結する */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('リスト nums1 を nums の後ろに連結し、nums = $nums を取得');

  /* リストをソート */
  nums.sort();
  print('リストをソートした後 nums = $nums');
}
