/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 버킷 정렬 */
void bucketSort(List<double> nums) {
  // 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. 배열 원소를 각 버킷에 배정한다
  for (double _num in nums) {
    // 입력 데이터의 범위는 [0, 1)이며, _num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
    int i = (_num * k).toInt();
    // _num을 버킷 bucket_idx에 추가한다
    buckets[i].add(_num);
  }
  // 2. 각 버킷을 정렬한다
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. 버킷을 순회하여 결과를 합친다
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* 실행 코드*/
void main() {
  // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('버킷 정렬 후 nums = $nums');
}
