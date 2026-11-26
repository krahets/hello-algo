/**
 * File: radix_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Get digit k of _num, where exp = 10^(k-1) */
int digit(int _num, int exp) {
  // Passing exp instead of k avoids repeating the costly exponentiation here
  return (_num ~/ exp) % 10;
}

/* Counting sort by digit k of each element in nums */
void countingSortDigit(List<int> nums, int exp) {
  // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
  List<int> counter = List<int>.filled(10, 0);
  int n = nums.length;
  // Count the occurrences of digits 0 through 9
  for (int i = 0; i < n; i++) {
    int d = digit(nums[i], exp); // Let d be digit k of nums[i]
    counter[d]++; // Count this occurrence of digit d
  }
  // Compute prefix sums to convert counts into array positions
  for (int i = 1; i < 10; i++) {
    counter[i] += counter[i - 1];
  }
  // Traverse backward and use the bucket counts to place each element in res
  List<int> res = List<int>.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int d = digit(nums[i], exp);
    int j = counter[d] - 1; // Get the array index j for d
    res[j] = nums[i]; // Place the current element at index j
    counter[d]--; // Decrement the count for d by 1
  }
  // Copy the result back into nums
  for (int i = 0; i < n; i++) nums[i] = res[i];
}

/* Radix sort */
void radixSort(List<int> nums) {
  // Find the largest element to determine the maximum number of digits
  // In Dart, int is 64 bits wide
  int m = -1 << 63;
  for (int _num in nums) if (_num > m) m = _num;
  // Work from the least significant digit to the most significant
  for (int exp = 1; exp <= m; exp *= 10)
    // Apply counting sort to the array elements by digit k
    // k = 1 -> exp = 1
    // k = 2 -> exp = 10
    // Here exp = 10^(k-1)
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
