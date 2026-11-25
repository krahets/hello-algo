/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Найти k наибольших элементов массива с помощью кучи */
MinHeap topKHeap(List<int> nums, int k) {
  // Инициализировать мин-кучу и добавить в неё первые k элементов массива
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
  for (int i = k; i < nums.length; i++) {
    // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* Пример использования */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("Наибольшие элементы (всего $k):");
  res.print();
}

/* Мин-куча */
class MinHeap {
  late List<int> _minHeap;

  /* Конструктор кучи по входному списку */
  MinHeap(List<int> nums) {
    // Поместить элементы списка в кучу в прежнем порядке
    _minHeap = nums;
    // Выполнить просеивание для всех узлов, кроме листьев
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* Вернуть элементы кучи */
  List<int> getHeap() {
    return _minHeap;
  }

  /* Индекс левого ребёнка */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* Индекс правого ребёнка */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* Индекс родителя */
  int _parent(int i) {
    return (i - 1) ~/ 2; // Целочисленное деление с округлением вниз
  }

  /* Поменять элементы местами */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* Размер кучи */
  int size() {
    return _minHeap.length;
  }

  /* Проверить, пуста ли куча */
  bool isEmpty() {
    return size() == 0;
  }

  /* Посмотреть элемент в корне */
  int peek() {
    return _minHeap[0];
  }

  /* Вставить элемент в кучу */
  void push(int val) {
    // Добавить узел
    _minHeap.add(val);
    // Просеивание вверх
    siftUp(size() - 1);
  }

  /* Просеивать вверх от узла i */
  void siftUp(int i) {
    while (true) {
      // Найти родителя узла i
      int p = _parent(i);
      // Если вышли за корень или узел уже на своём месте, завершить просеивание
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // Поменять два узла местами
      _swap(i, p);
      // Продолжить просеивание вверх
      i = p;
    }
  }

  /* Извлечь элемент из кучи */
  int pop() {
    // Проверить, пуста ли куча
    if (isEmpty()) throw Exception('Куча пуста');
    // Поменять местами корень и крайний правый лист (первый и последний элементы)
    _swap(0, size() - 1);
    // Удалить узел
    int val = _minHeap.removeLast();
    // Просеивание вниз
    siftDown(0);
    // Вернуть элемент из корня
    return val;
  }

  /* Просеивать вниз от узла i */
  void siftDown(int i) {
    while (true) {
      // Сохранить в ma индекс наибольшего из узлов i, l и r
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // Если i уже наибольший или оба индекса l и r вне диапазона, завершить просеивание
      if (mi == i) break;
      // Поменять два узла местами
      _swap(i, mi);
      // Продолжить просеивание вниз
      i = mi;
    }
  }

  /* Вывести кучу в виде бинарного дерева */
  void print() {
    printHeap(_minHeap);
  }
}
