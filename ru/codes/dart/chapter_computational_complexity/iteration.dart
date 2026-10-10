/**
 * File: iteration.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Цикл for */
int forLoop(int n) {
  int res = 0;
  // Циклическое суммирование 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    res += i;
  }
  return res;
}

/* Цикл while */
int whileLoop(int n) {
  int res = 0;
  int i = 1; // Инициализация условной переменной
  // Циклическое суммирование 1, 2, ..., n-1, n
  while (i <= n) {
    res += i;
    i++; // Обновить условную переменную
  }
  return res;
}

/* Цикл while (двойное обновление) */
int whileLoopII(int n) {
  int res = 0;
  int i = 1; // Инициализация условной переменной
  // Циклическое суммирование 1, 4, 10, ...
  while (i <= n) {
    res += i;
    // Обновить условную переменную
    i++;
    i *= 2;
  }
  return res;
}

/* Двойной цикл for */
String nestedForLoop(int n) {
  String res = "";
  // Цикл по i = 1, 2, ..., n-1, n
  for (int i = 1; i <= n; i++) {
    // Цикл по j = 1, 2, ..., n-1, n
    for (int j = 1; j <= n; j++) {
      res += "($i, $j), ";
    }
  }
  return res;
}

/* Driver Code */
void main() {
  int n = 5;
  int res;

  res = forLoop(n);
  print("\nРезультат суммирования в цикле for res = $res");

  res = whileLoop(n);
  print("\nРезультат суммирования в цикле while res = $res");

  res = whileLoopII(n);
  print("\nРезультат суммирования в цикле while (двойное обновление) res = $res");

  String resStr = nestedForLoop(n);
  print("\nРезультат двойного цикла for $resStr");
}
