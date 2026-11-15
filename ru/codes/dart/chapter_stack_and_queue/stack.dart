/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  // [region]{init_stack}
  /* Инициализация стека */
  // В Dart нет встроенного класса стека, поэтому List можно использовать как стек
  final List<int> stack = [];
  // [endregion]{init_stack}

  // [region]{push}
  /* Помещение элемента в стек */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  // [endregion]{push}
  print("Стек stack = $stack");

  // [region]{peek}
  /* Доступ к верхнему элементу стека */
  final int peek = stack.last;
  // [endregion]{peek}
  print("Верхний элемент peek = $peek");

  // [region]{pop}
  /* Извлечение элемента из стека */
  final int pop = stack.removeLast();
  // [endregion]{pop}
  print("Извлеченный элемент pop = $pop, stack после извлечения = $stack");

  // [region]{size}
  /* Получение длины стека */
  final int size = stack.length;
  // [endregion]{size}
  print("Длина стека size = $size");

  // [region]{is_empty}
  /* Проверка на пустоту */
  final bool isEmpty = stack.isEmpty;
  // [endregion]{is_empty}
  print("Пуст ли стек = $isEmpty");
}
