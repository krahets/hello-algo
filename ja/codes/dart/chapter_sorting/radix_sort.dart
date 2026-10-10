/**
 * File: radix_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* 要素 `_num` の第 k 桁を取得する。ここで `exp = 10^(k-1)` */
int digit(int _num, int exp) {
  // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
  return (_num ~/ exp) % 10;
}

/* 計数ソート（nums の k 桁目でソート） */
void countingSortDigit(List<int> nums, int exp) {
  // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
  List<int> counter = List<int>.filled(10, 0);
  int n = nums.length;
  // 0~9 の各数字の出現回数を集計する
  for (int i = 0; i < n; i++) {
    int d = digit(nums[i], exp); // nums[i] の第 k 位を取得し、d とする
    counter[d]++; // 数字 d の出現回数を数える
  }
  // 累積和を求め、「出現回数」を「配列インデックス」に変換する
  for (int i = 1; i < 10; i++) {
    counter[i] += counter[i - 1];
  }
  // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
  List<int> res = List<int>.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int d = digit(nums[i], exp);
    int j = counter[d] - 1; // d の配列内インデックス j を取得する
    res[j] = nums[i]; // 現在の要素をインデックス j に格納する
    counter[d]--; // d の個数を 1 減らす
  }
  // 結果で元の配列 nums を上書きする
  for (int i = 0; i < n; i++) nums[i] = res[i];
}

/* 基数ソート */
void radixSort(List<int> nums) {
  // 最大桁数の判定用に配列の最大要素を取得する
  // dart の `int` の長さは 64 ビット
  int m = -1 << 63;
  for (int _num in nums) if (_num > m) m = _num;
  // 下位桁から上位桁の順に走査する
  for (int exp = 1; exp <= m; exp *= 10)
    // 配列要素の k 桁目に対して計数ソートを行う
    // k = 1 -> exp = 1
    // k = 2 -> exp = 10
    // つまり exp = 10^(k-1)
    countingSortDigit(nums, exp);
}

/* Driver Code */
void main() {
  // 基数ソート
  List<int> nums = [
    10546151,
    35663510,
    42865989,
    34862445,
    81883077,
    88906420,
    72429244,
    30524779,
    82060337,
    63832996
  ];
  radixSort(nums);
  print("基数ソート完了後 nums = $nums");
}
