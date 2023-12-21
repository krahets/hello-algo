/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 桶排序 */
void bucketSort(List<double> nums) {
  // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. 将数组元素分配到各个桶中
  for (double _num in nums) {
    // 输入数据范围为 [0, 1)，使用 _num * k 映射到索引范围 [0, k-1]
    int i = (_num * k).toInt();
    // 将 _num 添加进桶 bucket_idx
    buckets[i].add(_num);
  }
  // 2. 对各个桶执行排序
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. 遍历桶合并结果
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Driver Code*/
void main() {
  // 设输入数据为浮点数，范围为 [0, 1)
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('桶排序完成后 nums = $nums');
}
