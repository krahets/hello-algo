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

  /* Получение длины стека */
  int size() {
    return _stack.length;
  }

  /* Проверка, пуст ли стек */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* Поместить в стек */
  void push(int _num) {
    _stack.add(_num);
  }

  /* Извлечь из стека */
  int pop() {
    if (isEmpty()) {
      throw Exception("стек пуст");
    }
    return _stack.removeLast();
  }

  /* Доступ к верхнему элементу стека */
  int peek() {
    if (isEmpty()) {
      throw Exception("стек пуст");
    }
    return _stack.last;
  }

  /* Преобразовать стек в Array и вернуть */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* Инициализация стека */
  final ArrayStack stack = ArrayStack();

  /* Помещение элемента в стек */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Стек stack = ${stack.toArray()}");

  /* Доступ к верхнему элементу стека */
  final int peek = stack.peek();
  print("Верхний элемент peek = $peek");

  /* Извлечение элемента из стека */
  final int pop = stack.pop();
  print("Извлеченный элемент pop = $pop, stack после извлечения = ${stack.toArray()}");

  /* Получение длины стека */
  final int size = stack.size();
  print("Длина стека size = $size");

  /* Проверка на пустоту */
  final bool isEmpty = stack.isEmpty();
  print("Пуст ли стек = $isEmpty");
}
