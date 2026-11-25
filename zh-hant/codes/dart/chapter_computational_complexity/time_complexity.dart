/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* 常數階 */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* 線性階 */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* 線性階（走訪陣列） */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // 迴圈次數與陣列長度成正比
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* 平方階 */
int quadratic(int n) {
  int count = 0;
  // 迴圈次數正比於資料大小 n 的平方
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* 平方階（氣泡排序） */
int bubbleSort(List<int> nums) {
  int count = 0; // 計數器
  // 外層迴圈：未排序區間為 [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // 交換 nums[j] 與 nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // 交換元素需 3 個基本操作
      }
    }
  }
  return count;
}

/* 指數階（迴圈實作） */
int exponential(int n) {
  int count = 0, base = 1;
  // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* 指數階（遞迴實作） */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 對數階（迴圈實作） */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* 對數階（遞迴實作） */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* 線性對數階 */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* 階乘階（遞迴實作） */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // 1 個呼叫分為 n 個
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* 主程式 */
void main() {
  // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
  int n = 8;
  print('輸入規模 n = $n');

  int count = constant(n);
  print('常數階的操作次數 = $count');

  count = linear(n);
  print('線性階的操作次數 = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('線性階（走訪陣列）的操作次數 = $count');

  count = quadratic(n);
  print('平方階的操作次數 = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('平方階（氣泡排序）的操作次數 = $count');

  count = exponential(n);
  print('指數階（迴圈實作）的操作次數 = $count');
  count = expRecur(n);
  print('指數階（遞迴實作）的操作次數 = $count');

  count = logarithmic(n);
  print('對數階（迴圈實作）的操作次數 = $count');
  count = logRecur(n);
  print('對數階（遞迴實作）的操作次數 = $count');

  count = linearLogRecur(n);
  print('線性對數階（遞迴實作）的操作次數 = $count');

  count = factorialRecur(n);
  print('階乘階（遞迴實作）的操作次數 = $count');
}
