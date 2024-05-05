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

/* Linear complexity (traversing an array) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // Loop count is proportional to the length of the array
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* Quadratic complexity */
int quadratic(int n) {
  int count = 0;
  // Loop count is squared in relation to the data size n
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
  // Outer loop: unsorted range is [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Swap nums[j] and nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // Element swap includes 3 individual operations
      }
    }
  }
  return count;
}

/* Exponential complexity (loop implementation) */
int exponential(int n) {
  int count = 0, base = 1;
  // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
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

/* Logarithmic complexity (loop implementation) */
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

/* Linear logarithmic complexity */
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
  // From 1 split into n
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* Driver Code */
void main() {
  // Can modify n to experience the trend of operation count changes under various complexities
  int n = 8;
  print('输入数据大小 n = $n');

  int count = constant(n);
  print('常数阶的操作数量 = $count');

  count = linear(n);
  print('线性阶的操作数量 = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('线性阶（遍历数组）的操作数量 = $count');

  count = quadratic(n);
  print('平方阶的操作数量 = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('平方阶（冒泡排序）的操作数量 = $count');

  count = exponential(n);
  print('指数阶（循环实现）的操作数量 = $count');
  count = expRecur(n);
  print('指数阶（递归实现）的操作数量 = $count');

  count = logarithmic(n);
  print('对数阶（循环实现）的操作数量 = $count');
  count = logRecur(n);
  print('对数阶（递归实现）的操作数量 = $count');

  count = linearLogRecur(n);
  print('线性对数阶（递归实现）的操作数量 = $count');

  count = factorialRecur(n);
  print('阶乘阶（递归实现）的操作数量 = $count');
}
