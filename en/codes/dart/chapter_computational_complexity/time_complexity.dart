/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Constant time */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* Linear time */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Linear time (array traversal) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // The iteration count is proportional to the array length
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* Quadratic time */
int quadratic(int n) {
  int count = 0;
  // The iteration count grows quadratically with input size n
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* Quadratic time (bubble sort) */
int bubbleSort(List<int> nums) {
  int count = 0; // Counter
  // Outer loop: the unsorted range is the closed interval [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Swap nums[j] and nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // Swapping two elements takes 3 elementary operations
      }
    }
  }
  return count;
}

/* Exponential time (iterative) */
int exponential(int n) {
  int count = 0, base = 1;
  // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* Exponential time (recursive) */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic time (iterative) */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* Logarithmic time (recursive) */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* Linearithmic time */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Factorial time (recursive) */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // Split one problem into n subproblems
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* Driver Code */
void main() {
  // Try different values of n to see how the operation count grows for each complexity
  int n = 8;
  print('Input size n = $n');

  int count = constant(n);
  print('Constant operation count = $count');

  count = linear(n);
  print('Linear operation count = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('Linear operation count (array traversal) = $count');

  count = quadratic(n);
  print('Quadratic operation count = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('Quadratic operation count (bubble sort) = $count');

  count = exponential(n);
  print('Exponential operation count (iterative) = $count');
  count = expRecur(n);
  print('Exponential operation count (recursive) = $count');

  count = logarithmic(n);
  print('Logarithmic operation count (iterative) = $count');
  count = logRecur(n);
  print('Logarithmic operation count (recursive) = $count');

  count = linearLogRecur(n);
  print('Linearithmic operation count (recursive) = $count');

  count = factorialRecur(n);
  print('Factorial operation count (recursive) = $count');
}
