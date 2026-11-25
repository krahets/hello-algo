/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* 상수 차수 */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* 선형 차수 */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* 선형 차수(배열 순회) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // 반복 횟수는 배열 길이에 비례한다
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* 이차 차수 */
int quadratic(int n) {
  int count = 0;
  // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* 이차 차수(버블 정렬) */
int bubbleSort(List<int> nums) {
  int count = 0; // 카운터
  // 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
  for (var i = nums.length - 1; i > 0; i--) {
    // 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // nums[j]와 nums[j + 1]의 값을 맞바꾼다
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
      }
    }
  }
  return count;
}

/* 지수 차수(반복 구현) */
int exponential(int n) {
  int count = 0, base = 1;
  // 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* 지수 차수(재귀 구현) */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* 로그 차수(반복 구현) */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* 로그 차수(재귀 구현) */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* 선형 로그 차수 */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* 팩토리얼 차수(재귀 구현) */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // 하나가 n개로 나뉜다
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* 실행 예제 */
void main() {
  // n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
  int n = 8;
  print('입력 크기 n = $n');

  int count = constant(n);
  print('상수 차수 연산 횟수 = $count');

  count = linear(n);
  print('선형 차수 연산 횟수 = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('선형 차수(배열 순회) 연산 횟수 = $count');

  count = quadratic(n);
  print('이차 차수 연산 횟수 = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('이차 차수(버블 정렬) 연산 횟수 = $count');

  count = exponential(n);
  print('지수 차수(반복 구현) 연산 횟수 = $count');
  count = expRecur(n);
  print('지수 차수(재귀 구현) 연산 횟수 = $count');

  count = logarithmic(n);
  print('로그 차수(반복 구현) 연산 횟수 = $count');
  count = logRecur(n);
  print('로그 차수(재귀 구현) 연산 횟수 = $count');

  count = linearLogRecur(n);
  print('선형 로그 차수(재귀 구현) 연산 횟수 = $count');

  count = factorialRecur(n);
  print('팩토리얼 차수(재귀 구현) 연산 횟수 = $count');
}
