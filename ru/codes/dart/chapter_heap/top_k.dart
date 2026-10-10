/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Найти k наибольших элементов массива с помощью кучи */
MinHeap topKHeap(List<int> nums, int k) {
  // Инициализировать минимальную кучу, поместив в нее первые k элементов массива
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // Начиная с элемента k+1, поддерживать длину кучи равной k
  for (int i = k; i < nums.length; i++) {
    // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
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
  print("Наибольшие $k элементов");
  res.print();
}

/* Минимальная куча */
class MinHeap {
  late List<int> _minHeap;

  /* Конструктор, строящий кучу по входному списку */
  MinHeap(List<int> nums) {
    // Добавить элементы списка в кучу без изменений
    _minHeap = nums;
    // Выполнить heapify для всех узлов, кроме листовых
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Вернуть элементы в куче */
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

  /* Получение размера кучи */
  int size() {
    return _minHeap.length;
  }

  /* Проверка, пуста ли куча */
  bool isEmpty() {
    return size() == 0;
  }

  /* Доступ к элементу на вершине кучи */
  int peek() {
    return _minHeap[0];
  }

  /* Добавление элемента в кучу */
  void push(int val) {
    // Добавление узла
    _minHeap.add(val);
    // Просеивание снизу вверх
    siftUp(size() - 1);
  }

  /* Начиная с узла i, выполнить просеивание снизу вверх */
  void siftUp(int i) {
    while (true) {
      // Получение родительского узла для узла i
      int p = _parent(i);
      // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
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
    int val = _minHeap.removeLast();
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
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
      if (mi == i) break;
      // Поменять два узла местами
      _swap(i, mi);
      // Циклическое просеивание вниз
      i = mi;
    }
  }

  /* Вывести кучу (двоичное дерево) */
  void print() {
    printHeap(_minHeap);
  }
}
