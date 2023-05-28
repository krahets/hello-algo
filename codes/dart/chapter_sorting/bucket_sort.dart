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
  for (double num in nums) {
    // 输入数据范围 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
    int i = (num * k).toInt();
    // 将 num 添加进桶 bucket_idx
    buckets[i].add(num);
  }
  // 2. 对各个桶执行排序
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. 遍历桶合并结果
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double num in bucket) {
      nums[i++] = num;
    }
  }
}

/* Driver Code*/
void main() {
  // 设输入数据为浮点数，范围为 [0, 1)
  final nums = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
  bucketSort(nums);
  print('桶排序完成后 = $nums');
}
