/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* バケットソート */
void bucketSort(List<double> nums) {
  // k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. 配列の要素を各バケットに振り分ける
  for (double _num in nums) {
    // 入力範囲は [0, 1)。_num * k でインデックスの範囲 [0, k-1] に写す
    int i = (_num * k).toInt();
    // _num をバケット bucket_idx に追加
    buckets[i].add(_num);
  }
  // 2. 各バケットをソートする
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. バケットを順に連結
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* 実行例*/
void main() {
  // 入力は [0, 1) の範囲の浮動小数点数とする
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('バケットソート後の nums = $nums');
}
