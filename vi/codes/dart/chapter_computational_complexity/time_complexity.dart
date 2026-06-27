/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Constant order */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* Linear order */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Linear order (traversing array) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // Number of iterations is proportional to the array length
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* Exponential order */
int quadratic(int n) {
  int count = 0;
  // Number of iterations is quadratically related to the data size n
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* Quadratic order (bubble sort) */
int bubbleSort(List<int> nums) {
  int count = 0; // Counter
  // Outer loop: unsorted range is [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Swap nums[j] and nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // Element swap includes 3 unit operations
      }
    }
  }
  return count;
}

/* Exponential order (loop implementation) */
int exponential(int n) {
  int count = 0, base = 1;
  // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* Exponential order (recursive implementation) */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic order (loop implementation) */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* Logarithmic order (recursive implementation) */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* Linearithmic order */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Factorial order (recursive implementation) */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // Split from 1 into n
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* Driver Code */
void main() {
  // You can modify n to run and observe the trend of the number of operations for various complexities
  int n = 8;
  print('Input data size n = $n');

  int count = constant(n);
  print('Constant-time operations count = $count');

  count = linear(n);
  print('Linear-time operations count = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('Linear-time (array traversal) operations count = $count');

  count = quadratic(n);
  print('Quadratic-time operations count = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('Quadratic-time (bubble sort) operations count = $count');

  count = exponential(n);
  print('Exponential-time (iterative) operations count = $count');
  count = expRecur(n);
  print('Exponential-time (recursive) operations count = $count');

  count = logarithmic(n);
  print('Logarithmic-time (iterative) operations count = $count');
  count = logRecur(n);
  print('Logarithmic-time (recursive) operations count = $count');

  count = linearLogRecur(n);
  print('Linearithmic-time (recursive) operations count = $count');

  count = factorialRecur(n);
  print('Factorial-time (recursive) operations count = $count');
}
