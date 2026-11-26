/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Инициализировать стек */
  // В Dart нет встроенного класса стека, поэтому в качестве стека можно использовать List
  final List<int> stack = [];

  /* Поместить элементы в стек */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("Стек stack = $stack");

  /* Посмотреть элемент на вершине стека */
  final int peek = stack.last;
  print("Элемент на вершине стека peek = $peek");

  /* Снять элемент со стека */
  final int pop = stack.removeLast();
  print("Снятый элемент pop = $pop, после снятия stack = $stack");

  /* Получить размер стека */
  final int size = stack.length;
  print("Размер стека size = $size");

  /* Проверить, пуст ли стек */
  final bool isEmpty = stack.isEmpty;
  print("Стек пуст = $isEmpty");
}
