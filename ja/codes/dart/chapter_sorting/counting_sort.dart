/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* 計数ソート */
// 簡易実装のため、オブジェクトのソートには使えない
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
  // 3. counter を走査し、各要素を元の配列 nums に書き戻す
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* 計数ソート */
// 完全な実装で、オブジェクトをソートでき、かつ安定ソートである
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
  // 3. counter の累積和を求め、「出現回数」を「末尾インデックス」に変換する
  // つまり counter[_num]-1 は、res において _num が最後に出現する位置のインデックスである
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. nums を逆順に走査し、各要素を結果配列 res に格納する
  // 結果を記録するための配列 res を初期化
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // _num を対応する添字に配置
    counter[_num]--; // 累積和を 1 減らし、次に _num を配置するインデックスを得る
  }
  // 結果配列 res で元の配列 nums を上書きする
  nums.setAll(0, res);
}

/* Driver Code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('カウントソート（オブジェクトはソート不可）完了後 nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('カウントソート完了後 nums1 = $nums1');
}
