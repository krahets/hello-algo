/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* 実行用コード */
void main() {
  // [region]{init_list}
  /* リストを初期化する */
  // 初期値なし
  List<int> emptyNums = [];
  // 初期値あり
  List<int> nums = [1, 3, 2, 5, 4];
  // [endregion]{init_list}
  print('リスト nums = $nums');
  print('リスト emptyNums = $emptyNums');

  // [region]{access_element}
  /* 要素にアクセスする */
  int _num = nums[1]; // インデックス 1 の要素にアクセスする
  // [endregion]{access_element}
  print('インデックス 1 の要素にアクセスした結果 _num = $_num');

  // [region]{update_element}
  /* 要素を更新する */
  nums[1] = 0; // インデックス 1 の要素を 0 に更新する
  // [endregion]{update_element}
  print('インデックス 1 の要素を 0 に更新した結果 nums = $nums');

  // [region]{clear_list}
  /* リストを空にする */
  nums.clear();
  // [endregion]{clear_list}
  print('リストを空にした後 nums = $nums');

  // [region]{append_element}
  /* 末尾に要素を追加する */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  // [endregion]{append_element}
  print('要素を追加した後 nums = $nums');

  // [region]{insert_element}
  /* 途中に要素を挿入する */
  nums.insert(3, 6); // インデックス 3 に数値 6 を挿入する
  // [endregion]{insert_element}
  print('インデックス 3 に数値 6 を挿入した結果 nums = $nums');

  // [region]{remove_element}
  /* 要素を削除する */
  nums.removeAt(3); // インデックス 3 の要素を削除する
  // [endregion]{remove_element}
  print('インデックス 3 の要素を削除した結果 nums = $nums');

  // [region]{iterate_list}
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
  // [endregion]{iterate_list}

  // [region]{concat_list}
  /* 2 つのリストを連結する */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1); // リスト nums の後ろに nums1 を連結する
  // [endregion]{concat_list}
  print('リスト nums の後ろに nums1 を連結した結果 nums = $nums');

  // [region]{sort_list}
  /* リストをソートする */
  nums.sort(); // ソート後、リストの要素は昇順に並ぶ
  // [endregion]{sort_list}
  print('リストをソートした後 nums = $nums');
}
