/**
 * File: recursion.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Рекурсия */
int recur(int n) {
  // Условие завершения
  if (n == 1) return 1;
  // Рекурсия: рекурсивный вызов
  int res = recur(n - 1);
  // Возврат: вернуть результат
  return n + res;
}

/* Имитация рекурсии итерацией */
int forLoopRecur(int n) {
  // Использовать явный стек для имитации системного стека вызовов
  List<int> stack = [];
  int res = 0;
  // Рекурсия: рекурсивный вызов
  for (int i = n; i > 0; i--) {
    // Имитировать «рекурсию» с помощью операции помещения в стек
    stack.add(i);
  }
  // Возврат: вернуть результат
  while (!stack.isEmpty) {
    // Имитировать «возврат» с помощью операции извлечения из стека
    res += stack.removeLast();
  }
  // res = 1+2+3+...+n
  return res;
}

/* Хвостовая рекурсия */
int tailRecur(int n, int res) {
  // Условие завершения
  if (n == 0) return res;
  // Хвостовой рекурсивный вызов
  return tailRecur(n - 1, res + n);
}

/* Последовательность Фибоначчи: рекурсия */
int fib(int n) {
  // Условие завершения: f(1) = 0, f(2) = 1
  if (n == 1 || n == 2) return n - 1;
  // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
  int res = fib(n - 1) + fib(n - 2);
  // Вернуть результат f(n)
  return res;
}

/* Driver Code */
void main() {
  int n = 5;
  int res;

  res = recur(n);
  print("\nРезультат суммирования в рекурсивной функции res = $res");

  res = tailRecur(n, 0);
  print("\nРезультат суммирования в хвостовой рекурсии res = $res");

  res = forLoopRecur(n);
  print("\nРезультат суммирования при имитации рекурсии итерацией res = $res");

  res = fib(n);
  print("\nЧлен последовательности Фибоначчи с номером $n = $res");
}
