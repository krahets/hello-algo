/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Max-куча */
class MaxHeap {
  late List<int> _maxHeap;

  /* Конструктор, создающий кучу по входному списку */
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

  /* Получить размер кучи */
  int size() {
    return _maxHeap.length;
  }

  /* Проверить, пуста ли куча */
  bool isEmpty() {
    return size() == 0;
  }

  /* Обратиться к элементу на вершине кучи */
  int peek() {
    return _maxHeap[0];
  }

  /* Добавить элемент в кучу */
  void push(int val) {
    // Добавить узел
    _maxHeap.add(val);
    // Выполнить heapify снизу вверх
    siftUp(size() - 1);
  }

  /* Начиная с узла i, выполнить просеивание снизу вверх */
  void siftUp(int i) {
    while (true) {
      // Получить родительский узел для узла i
      int p = _parent(i);
      // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
        break;
      }
      // Поменять местами два узла
      _swap(i, p);
      // Циклически выполнять просеивание вверх
      i = p;
    }
  }

  /* Извлечение элемента из кучи */
  int pop() {
    // Обработка пустого случая
    if (isEmpty()) throw Exception('кучапуст');
    // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
    _swap(0, size() - 1);
    // Удалить узел
    int val = _maxHeap.removeLast();
    // Выполнить heapify сверху вниз
    siftDown(0);
    // Вернуть элемент на вершине кучи
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
      // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
      if (ma == i) break;
      // Поменять местами два узла
      _swap(i, ma);
      // Циклически выполнять просеивание вниз
      i = ma;
    }
  }

  /* Вывести кучу (в виде двоичного дерева) */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* Инициализировать max-кучу */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nПосле построения кучи по входному списку");
  maxHeap.print();

  /* Получить верхний элемент кучи */
  int peek = maxHeap.peek();
  print("\nвершина кучиэлементравно $peek");

  /* Добавить элемент в кучу */
  int val = 7;
  maxHeap.push(val);
  print("\nПосле добавления элемента $val в кучу");
  maxHeap.print();

  /* Извлечь верхний элемент из кучи */
  peek = maxHeap.pop();
  print("\nПосле извлечения верхнего элемента $peek из кучи");
  maxHeap.print();

  /* Получить размер кучи */
  int size = maxHeap.size();
  print("\nКоличество элементов в куче равно $size");

  /* Проверить, пуста ли куча */
  bool isEmpty = maxHeap.isEmpty();
  print("\nкучапуст ли $isEmpty");
}
