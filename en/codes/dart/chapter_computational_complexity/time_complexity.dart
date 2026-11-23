/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Constant complexity */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* Linear complexity */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Linear complexity (array traversal) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // The number of iterations is proportional to the array length
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* Quadratic complexity */
int quadratic(int n) {
  int count = 0;
  // The number of iterations is proportional to the square of the input size n
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* Quadratic complexity (bubble sort) */
int bubbleSort(List<int> nums) {
  int count = 0; // Counter
  // Outer loop: the unsorted range is [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
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

/* Exponential complexity (iterative implementation) */
int exponential(int n) {
  int count = 0, base = 1;
  // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* Exponential complexity (recursive implementation) */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic complexity (iterative implementation) */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* Logarithmic complexity (recursive implementation) */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* Linearithmic complexity */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Factorial complexity (recursive implementation) */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // Split one problem into n subproblems
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* Driver code */
void main() {
  // Try different values of n to see how the operation count grows for each complexity
  int n = 8;
  print('Input size n = $n');

  int count = constant(n);
  print('Operation count for constant complexity = $count');

  count = linear(n);
  print('Operation count for linear complexity = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('Operation count for linear complexity (array traversal) = $count');

  count = quadratic(n);
  print('Operation count for quadratic complexity = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('Operation count for quadratic complexity (bubble sort) = $count');

  count = exponential(n);
  print('Operation count for exponential complexity (iterative) = $count');
  count = expRecur(n);
  print('Operation count for exponential complexity (recursive) = $count');

  count = logarithmic(n);
  print('Operation count for logarithmic complexity (iterative) = $count');
  count = logRecur(n);
  print('Operation count for logarithmic complexity (recursive) = $count');

  count = linearLogRecur(n);
  print('Operation count for linearithmic complexity (recursive) = $count');

  count = factorialRecur(n);
  print('Operation count for factorial complexity (recursive) = $count');
}
