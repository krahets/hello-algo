/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Максимальная куча */
class MaxHeap {
  late List<int> _maxHeap;

  /* Конструктор, строящий кучу по входному списку */
  MaxHeap(List<int> nums) {
    // Добавить элементы списка в кучу без изменений
    _maxHeap = nums;
    // Выполнить heapify для всех узлов, кроме листовых
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Получить индекс левого дочернего узла */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* Получить индекс правого дочернего узла */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* Получить индекс родительского узла */
  int _parent(int i) {
    return (i - 1) ~/ 2; // Округление вниз при делении
  }

  /* Поменять элементы местами */
  void _swap(int i, int j) {
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* Получение размера кучи */
  int size() {
    return _maxHeap.length;
  }

  /* Проверка, пуста ли куча */
  bool isEmpty() {
    return size() == 0;
  }

  /* Доступ к элементу на вершине кучи */
  int peek() {
    return _maxHeap[0];
  }

  /* Добавление элемента в кучу */
  void push(int val) {
    // Добавление узла
    _maxHeap.add(val);
    // Просеивание снизу вверх
    siftUp(size() - 1);
  }

  /* Начиная с узла i, выполнить просеивание снизу вверх */
  void siftUp(int i) {
    while (true) {
      // Получение родительского узла для узла i
      int p = _parent(i);
      // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
        break;
      }
      // Поменять два узла местами
      _swap(i, p);
      // Циклическое просеивание вверх
      i = p;
    }
  }

  /* Извлечение элемента из кучи */
  int pop() {
    // Обработка пустого случая
    if (isEmpty()) throw Exception('куча пуста');
    // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
    _swap(0, size() - 1);
    // Удаление узла
    int val = _maxHeap.removeLast();
    // Просеивание сверху вниз
    siftDown(0);
    // Вернуть элемент с вершины кучи
    return val;
  }

  /* Начиная с узла i, выполнить просеивание сверху вниз */
  void siftDown(int i) {
    while (true) {
      // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
      int l = _left(i);
      int r = _right(i);
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
      if (ma == i) break;
      // Поменять два узла местами
      _swap(i, ma);
      // Циклическое просеивание вниз
      i = ma;
    }
  }

  /* Вывести кучу (двоичное дерево) */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* Инициализация максимальной кучи */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nПосле построения кучи из входного списка");
  maxHeap.print();

  /* Получение элемента с вершины кучи */
  int peek = maxHeap.peek();
  print("\nЭлемент на вершине кучи = $peek");

  /* Добавление элемента в кучу */
  int val = 7;
  maxHeap.push(val);
  print("\nПосле добавления элемента $val в кучу");
  maxHeap.print();

  /* Извлечение элемента с вершины кучи */
  peek = maxHeap.pop();
  print("\nПосле извлечения элемента вершины кучи $peek");
  maxHeap.print();

  /* Получение размера кучи */
  int size = maxHeap.size();
  print("\nКоличество элементов в куче = $size");

  /* Проверка, пуста ли куча */
  bool isEmpty = maxHeap.isEmpty();
  print("\nПуста ли куча: $isEmpty");
}
