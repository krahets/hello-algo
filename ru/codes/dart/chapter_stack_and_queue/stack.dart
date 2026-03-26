/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* Инициализировать стек */
  // В Dart нет встроенного класса стека, поэтому List можно использовать как стек
  final List<int> stack = [];

  /* Поместить элемент в стек */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("стек stack = $stack");

  /* Получить верхний элемент стека */
  final int peek = stack.last;
  print("вершина стекаэлемент peek = $peek");

  /* Извлечь элемент из стека */
  final int pop = stack.removeLast();
  print("извлечение из стекаэлемент pop = $pop, извлечение из стекапосле stack = $stack");

  /* Получить длину стека */
  final int size = stack.length;
  print("Длина стека size = $size");

  /* Проверить, пуста ли структура */
  final bool isEmpty = stack.isEmpty;
  print("Стек пуст: $isEmpty");
}
