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

  /* Получить длину стека */
  int size() {
    return _stack.length;
  }

  /* Проверить, пуст ли стек */
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
      throw Exception("стекпуст");
    }
    return _stack.removeLast();
  }

  /* Получить верхний элемент стека */
  int peek() {
    if (isEmpty()) {
      throw Exception("стекпуст");
    }
    return _stack.last;
  }

  /* Преобразовать стек в Array и вернуть */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* Инициализировать стек */
  final ArrayStack stack = ArrayStack();

  /* Поместить элемент в стек */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("стек stack = ${stack.toArray()}");

  /* Получить верхний элемент стека */
  final int peek = stack.peek();
  print("вершина стекаэлемент peek = $peek");

  /* Извлечь элемент из стека */
  final int pop = stack.pop();
  print("извлечение из стекаэлемент pop = $pop, извлечение из стекапосле stack = ${stack.toArray()}");

  /* Получить длину стека */
  final int size = stack.size();
  print("Длина стека size = $size");

  /* Проверить, пуста ли структура */
  final bool isEmpty = stack.isEmpty();
  print("стекпуст ли = $isEmpty");
}
