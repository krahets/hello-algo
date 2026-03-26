/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Найти k наибольших элементов массива с помощью кучи */
MinHeap topKHeap(List<int> nums, int k) {
  // Инициализировать min-кучу, Поместить первые k элементов массива в кучу
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // Начиная с k+1-го элемента, поддерживать длину кучи равной k
  for (int i = k; i < nums.length; i++) {
    // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("Наибольшие $k элементов:");
  res.print();
}

/* min-куча */
class MinHeap {
  late List<int> _minHeap;

  /* Конструктор, создающий кучу по входному списку */
  MinHeap(List<int> nums) {
    // Добавить элементы списка в кучу без изменений
    _minHeap = nums;
    // Выполнить heapify для всех узлов, кроме листовых
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Вернутькучавэлемент */
  List<int> getHeap() {
    return _minHeap;
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
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* Получить размер кучи */
  int size() {
    return _minHeap.length;
  }

  /* Проверить, пуста ли куча */
  bool isEmpty() {
    return size() == 0;
  }

  /* Обратиться к элементу на вершине кучи */
  int peek() {
    return _minHeap[0];
  }

  /* Добавить элемент в кучу */
  void push(int val) {
    // Добавить узел
    _minHeap.add(val);
    // Выполнить heapify снизу вверх
    siftUp(size() - 1);
  }

  /* Начиная с узла i, выполнить просеивание снизу вверх */
  void siftUp(int i) {
    while (true) {
      // Получить родительский узел для узла i
      int p = _parent(i);
      // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
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
    int val = _minHeap.removeLast();
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
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
      if (mi == i) break;
      // Поменять местами два узла
      _swap(i, mi);
      // Циклически выполнять просеивание вниз
      i = mi;
    }
  }

  /* Вывести кучу (в виде двоичного дерева) */
  void print() {
    printHeap(_minHeap);
  }
}
