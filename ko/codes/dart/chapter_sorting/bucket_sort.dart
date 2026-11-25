/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 버킷 정렬 */
void bucketSort(List<double> nums) {
  // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. 배열 원소를 각 버킷에 배분
  for (double _num in nums) {
    // 입력 범위는 [0, 1)이며 _num * k로 인덱스 범위 [0, k-1]에 대응시킴
    int i = (_num * k).toInt();
    // _num을 버킷 bucket_idx에 추가
    buckets[i].add(_num);
  }
  // 2. 각 버킷을 정렬
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. 버킷을 순회하여 결과 병합
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* 실행 예제*/
void main() {
  // 입력은 [0, 1) 범위의 부동 소수점 수로 가정
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('버킷 정렬 후 nums = $nums');
}
