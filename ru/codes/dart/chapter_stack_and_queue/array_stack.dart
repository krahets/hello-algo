/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Стек на основе массива */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* Получить размер стека */
  int size() {
    return _stack.length;
  }

  /* Проверить, пуст ли стек */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* Поместить элемент в стек */
  void push(int _num) {
    _stack.add(_num);
  }

  /* Снять элемент со стека */
  int pop() {
    if (isEmpty()) {
      throw Exception("Стек пуст");
    }
    return _stack.removeLast();
  }

  /* Посмотреть элемент на вершине стека */
  int peek() {
    if (isEmpty()) {
      throw Exception("Стек пуст");
    }
    return _stack.last;
  }

  /* Преобразовать стек в массив и вернуть его */
  List<int> toArray() => _stack;
}

/* Пример использования */
void main() {
  /* Инициализировать стек */
  final ArrayStack stack = ArrayStack();

  /* Поместить элементы в стек */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Стек stack = ${stack.toArray()}");

  /* Посмотреть элемент на вершине стека */
  final int peek = stack.peek();
  print("Элемент на вершине стека peek = $peek");

  /* Снять элемент со стека */
  final int pop = stack.pop();
  print("Снятый элемент pop = $pop, после снятия stack = ${stack.toArray()}");

  /* Получить размер стека */
  final int size = stack.size();
  print("Размер стека size = $size");

  /* Проверить, пуст ли стек */
  final bool isEmpty = stack.isEmpty();
  print("Стек пуст = $isEmpty");
}
