/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* Макс-куча */
class MaxHeap {
  late List<int> _maxHeap;

  /* Конструктор кучи по входному списку */
  MaxHeap(List<int> nums) {
    // Поместить элементы списка в кучу в прежнем порядке
    _maxHeap = nums;
    // Выполнить просеивание для всех узлов, кроме листьев
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* Размер кучи */
  int size() {
    return _maxHeap.length;
  }

  /* Проверить, пуста ли куча */
  bool isEmpty() {
    return size() == 0;
  }

  /* Посмотреть элемент в корне */
  int peek() {
    return _maxHeap[0];
  }

  /* Вставить элемент в кучу */
  void push(int val) {
    // Добавить узел
    _maxHeap.add(val);
    // Просеивание вверх
    siftUp(size() - 1);
  }

  /* Просеивать вверх от узла i */
  void siftUp(int i) {
    while (true) {
      // Найти родителя узла i
      int p = _parent(i);
      // Если вышли за корень или узел уже на своём месте, завершить просеивание
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // Если ни у одного потомка значение не больше, чем у родителя, завершить просеивание
      if (ma == i) break;
      // Поменять два узла местами
      _swap(i, ma);
      // Продолжить просеивание вниз
      i = ma;
    }
  }

  /* Вывести кучу в виде бинарного дерева */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Пример использования */
void main() {
  /* Инициализировать макс-кучу */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nКуча, построенная по входному списку:");
  maxHeap.print();

  /* Получить элемент в корне */
  int peek = maxHeap.peek();
  print("\nЭлемент в корне: $peek");

  /* Вставить элемент в кучу */
  int val = 7;
  maxHeap.push(val);
  print("\nПосле вставки элемента $val:");
  maxHeap.print();

  /* Извлечь элемент из корня */
  peek = maxHeap.pop();
  print("\nПосле извлечения элемента $peek из корня:");
  maxHeap.print();

  /* Размер кучи */
  int size = maxHeap.size();
  print("\nЧисло элементов в куче: $size");

  /* Проверить, пуста ли куча */
  bool isEmpty = maxHeap.isEmpty();
  print("\nПуста ли куча: $isEmpty");
}
