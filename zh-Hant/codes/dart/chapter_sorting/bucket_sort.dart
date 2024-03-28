/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 桶排序 */
void bucketSort(List<double> nums) {
  // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. 將陣列元素分配到各個桶中
  for (double _num in nums) {
    // 輸入資料範圍為 [0, 1)，使用 _num * k 對映到索引範圍 [0, k-1]
    int i = (_num * k).toInt();
    // 將 _num 新增進桶 bucket_idx
    buckets[i].add(_num);
  }
  // 2. 對各個桶執行排序
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. 走訪桶合併結果
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Driver Code*/
void main() {
  // 設輸入資料為浮點數，範圍為 [0, 1)
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('桶排序完成後 nums = $nums');
}
