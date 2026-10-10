/**
 * File: radix_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Get k-th digit of element _num, where exp = 10^(k-1) */
int digit(int _num, int exp) {
  // Passing exp instead of k can avoid repeated expensive exponentiation here
  return (_num ~/ exp) % 10;
}

/* Counting sort (based on nums k-th digit) */
void countingSortDigit(List<int> nums, int exp) {
  // Decimal digit range is 0~9, therefore need a bucket array of length 10
  List<int> counter = List<int>.filled(10, 0);
  int n = nums.length;
  // Count the occurrence of digits 0~9
  for (int i = 0; i < n; i++) {
    int d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
    counter[d]++; // Count the occurrence of digit d
  }
  // Calculate prefix sum, converting "occurrence count" into "array index"
  for (int i = 1; i < 10; i++) {
    counter[i] += counter[i - 1];
  }
  // Traverse in reverse, based on bucket statistics, place each element into res
  List<int> res = List<int>.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int d = digit(nums[i], exp);
    int j = counter[d] - 1; // Get the index j for d in the array
    res[j] = nums[i]; // Place the current element at index j
    counter[d]--; // Decrease the count of d by 1
  }
  // Use result to overwrite the original array nums
  for (int i = 0; i < n; i++) nums[i] = res[i];
}

/* Radix sort */
void radixSort(List<int> nums) {
  // Get the maximum element of the array, used to determine the maximum number of digits
  // In Dart, int length is 64 bits
  int m = -1 << 63;
  for (int _num in nums) if (_num > m) m = _num;
  // Traverse from the lowest to the highest digit
  for (int exp = 1; exp <= m; exp *= 10)
    // Perform counting sort on the k-th digit of array elements
    // k = 1 -> exp = 1
    // k = 2 -> exp = 10
    // i.e., exp = 10^(k-1)
    countingSortDigit(nums, exp);
}

/* Driver Code */
void main() {
  // Radix sort
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
  print("After radix sort, nums = $nums");
}
