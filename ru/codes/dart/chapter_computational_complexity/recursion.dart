/**
 * File: recursion.dart
 * Created Time: 2023-08-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Рекурсия */
int recur(int n) {
  // Условие остановки
  if (n == 1) return 1;
  // Спуск: рекурсивный вызов
  int res = recur(n - 1);
  // Возврат: передача результата
  return n + res;
}

/* Моделирование рекурсии с помощью итерации */
int forLoopRecur(int n) {
  // Смоделировать стек вызовов с помощью явного стека
  List<int> stack = [];
  int res = 0;
  // Спуск: рекурсивный вызов
  for (int i = n; i > 0; i--) {
    // Добавление в стек моделирует спуск
    stack.add(i);
  }
  // Возврат: передача результата
  while (!stack.isEmpty) {
    // Извлечение из стека моделирует возврат
    res += stack.removeLast();
  }
  // res = 1+2+3+...+n
  return res;
}

/* Хвостовая рекурсия */
int tailRecur(int n, int res) {
  // Условие остановки
  if (n == 0) return res;
  // Хвостовой рекурсивный вызов
  return tailRecur(n - 1, res + n);
}

/* Числа Фибоначчи: рекурсия */
int fib(int n) {
  // Базовые случаи: f(1) = 0, f(2) = 1
  if (n == 1 || n == 2) return n - 1;
  // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
  int res = fib(n - 1) + fib(n - 2);
  // Вернуть результат f(n)
  return res;
}

/* Основная программа */
void main() {
  int n = 5;
  int res;

  res = recur(n);
  print("\nСумма при рекурсии: res = $res");

  res = tailRecur(n, 0);
  print("\nСумма при хвостовой рекурсии: res = $res");

  res = forLoopRecur(n);
  print("\nСумма при итеративном моделировании рекурсии: res = $res");

  res = fib(n);
  print("\nЧисло Фибоначчи с номером $n равно $res");
}
