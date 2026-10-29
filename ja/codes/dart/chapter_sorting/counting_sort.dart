/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* カウントソート */
// 簡易実装。オブジェクトのソートには使えない
void countingSortNaive(List<int> nums) {
  // 1. 配列の最大要素 m を求める
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 各数値の出現回数を数える
  // counter[_num] は _num の出現回数を表す
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. counter を走査し、各要素を元の配列 nums に入れる
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* カウントソート */
// 完全な実装。オブジェクトをソートでき、安定ソートである
void countingSort(List<int> nums) {
  // 1. 配列の最大要素 m を求める
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. 各数値の出現回数を数える
  // counter[_num] は _num の出現回数を表す
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. counter の累積和を求め、「出現回数」を「末尾のインデックス」に変換する
  // つまり、counter[_num]-1 は res 内で _num が最後に現れるインデックスである
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. nums を逆順に走査し、各要素を結果配列 res に入れる
  // 結果を記録する配列 res を初期化する
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // 対応するインデックスに _num を配置する
    counter[_num]--; // 累積和を 1 減らし、次に _num を配置するインデックスを求める
  }
  // 結果配列 res で元の配列 nums を上書きする
  nums.setAll(0, res);
}

/* 実行用コード*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('カウントソート（オブジェクトはソート不可）の完了後 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('カウントソート完了後 nums1 = $nums1');
}
