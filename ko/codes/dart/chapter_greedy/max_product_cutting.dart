/**
 * File: max_product_cutting.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 탐욕 알고리즘으로 정수 분할의 최대 곱 구하기 */
int maxProductCutting(int n) {
  // n <= 3이면 반드시 1을 하나 떼어 낸다
  if (n <= 3) {
    return 1 * (n - 1);
  }
  // 탐욕적으로 3씩 떼어 낸다. a는 3의 개수이고 b는 나머지이다
  int a = n ~/ 3;
  int b = n % 3;
  if (b == 1) {
    // 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
    return (pow(3, a - 1) * 2 * 2).toInt();
  }
  if (b == 2) {
    // 나머지가 2이면 그대로 둔다
    return (pow(3, a) * 2).toInt();
  }
  // 나머지가 0이면 그대로 둔다
  return pow(3, a).toInt();
}

/* 실행 예제 */
void main() {
  int n = 58;

  // 탐욕 알고리즘
  int res = maxProductCutting(n);
  print("분할한 수들의 최대 곱: $res");
}
