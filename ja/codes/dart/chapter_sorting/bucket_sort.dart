/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* バケットソート */
void bucketSort(List<double> nums) {
  // k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. 配列要素を各バケットに振り分ける
  for (double _num in nums) {
    // 入力データの範囲は [0, 1) であり、_num * k を用いてインデックス範囲 [0, k-1] に写像する
    int i = (_num * k).toInt();
    // _num をバケット bucket_idx に追加
    buckets[i].add(_num);
  }
  // 2. 各バケットをソートする
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. バケットを走査して結果を結合
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Driver Code*/
void main() {
  // 入力データは範囲 [0, 1) の浮動小数点数とする
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('バケットソート完了後 nums = $nums');
}
