/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Bucket sort */
void bucketSort(List<double> nums) {
  // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. Distribute array elements into various buckets
  for (double _num in nums) {
    // Input data range is [0, 1), use _num * k to map to index range [0, k-1]
    int i = (_num * k).toInt();
    // Add _num to bucket bucket_idx
    buckets[i].add(_num);
  }
  // 2. Sort each bucket
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. Traverse buckets to merge results
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Driver Code*/
void main() {
  // Assume input data is floating point, interval [0, 1)
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('After bucket sort, nums = $nums');
}
