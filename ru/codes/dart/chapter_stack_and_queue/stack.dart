/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Инициализация стека */
  // В Dart нет встроенного класса стека, поэтому List можно использовать как стек
  final List<int> stack = [];

  /* Помещение элемента в стек */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("Стек stack = $stack");

  /* Доступ к верхнему элементу стека */
  final int peek = stack.last;
  print("Верхний элемент peek = $peek");

  /* Извлечение элемента из стека */
  final int pop = stack.removeLast();
  print("Извлеченный элемент pop = $pop, stack после извлечения = $stack");

  /* Получение длины стека */
  final int size = stack.length;
  print("Длина стека size = $size");

  /* Проверка на пустоту */
  final bool isEmpty = stack.isEmpty;
  print("Пуст ли стек = $isEmpty");
}
