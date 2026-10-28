/**
 * File: radix_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* 원소 _num의 k번째 자릿값 반환. 이때 exp = 10^(k-1)이다 */
int digit(int _num, int exp) {
  // k 대신 exp를 전달하면 여기서 비용이 큰 거듭제곱 계산을 반복하지 않아도 된다
  return (_num ~/ exp) % 10;
}

/* 계수 정렬(nums의 k번째 자릿값을 기준으로 정렬) */
void countingSortDigit(List<int> nums, int exp) {
  // 십진수의 각 자리는 0~9 범위이므로 길이가 10인 버킷 배열이 필요하다
  List<int> counter = List<int>.filled(10, 0);
  int n = nums.length;
  // 0~9 각 숫자의 등장 횟수를 센다
  for (int i = 0; i < n; i++) {
    int d = digit(nums[i], exp); // nums[i]의 k번째 자릿값을 구하여 d로 표시한다
    counter[d]++; // 숫자 d의 등장 횟수를 센다
  }
  // 접두 합을 구하여 등장 개수를 배열 인덱스로 변환한다
  for (int i = 1; i < 10; i++) {
    counter[i] += counter[i - 1];
  }
  // 역순으로 순회하며 버킷에 집계된 결과에 따라 각 원소를 res에 채운다
  List<int> res = List<int>.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int d = digit(nums[i], exp);
    int j = counter[d] - 1; // 배열에서 d의 인덱스 j를 구한다
    res[j] = nums[i]; // 현재 원소를 인덱스 j에 채운다
    counter[d]--; // d의 개수를 1 줄인다
  }
  // 결과로 원래 배열 nums를 덮어쓴다
  for (int i = 0; i < n; i++) nums[i] = res[i];
}

/* 기수 정렬 */
void radixSort(List<int> nums) {
  // 배열의 최댓값을 구하여 최대 자릿수를 판단한다
  // Dart에서 int의 길이는 64비트이다
  int m = -1 << 63;
  for (int _num in nums) if (_num > m) m = _num;
  // 낮은 자리에서 높은 자리 순서로 순회한다
  for (int exp = 1; exp <= m; exp *= 10)
    // 배열 원소의 k번째 자릿값에 대해 계수 정렬을 수행한다
    // k = 1 -> exp = 1
    // k = 2 -> exp = 10
    // 즉, exp = 10^(k-1)이다
    countingSortDigit(nums, exp);
}

/* 실행 코드 */
void main() {
  // 기수 정렬
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
  print("기수 정렬 후 nums = $nums");
}
