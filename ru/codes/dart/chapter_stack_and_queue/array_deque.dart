/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Двусторонняя очередь (дек) на основе кольцевого массива */
class ArrayDeque {
  late List<int> _nums; // Массив для хранения элементов дека
  late int _front; // Индекс первого элемента дека
  late int _queSize; // Длина дека

  /* Конструктор */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* Получить ёмкость дека */
  int capacity() {
    return _nums.length;
  }

  /* Получить длину дека */
  int size() {
    return _queSize;
  }

  /* Проверить, пуст ли дек */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Вычислить индекс в кольцевом массиве */
  int index(int i) {
    // Операция взятия остатка связывает конец массива с его началом
    // Если индекс i выходит за конец массива, отсчёт продолжается с начала
    // Если индекс i выходит за начало массива, отсчёт продолжается с конца
    return (i + capacity()) % capacity();
  }

  /* Добавить элемент в начало дека */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Дек заполнен");
    }
    // Сдвинуть индекс начала дека на одну позицию влево
    // При выходе за начало массива операция взятия остатка возвращает _front в конец
    _front = index(_front - 1);
    // Добавить _num в начало дека
    _nums[_front] = _num;
    _queSize++;
  }

  /* Добавить элемент в конец дека */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Дек заполнен");
    }
    // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
    int rear = index(_front + _queSize);
    // Добавить _num в конец дека
    _nums[rear] = _num;
    _queSize++;
  }

  /* Извлечь элемент из начала дека */
  int popFirst() {
    int _num = peekFirst();
    // Сдвинуть индекс начала дека на одну позицию вправо
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Извлечь элемент из конца дека */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Посмотреть первый элемент дека */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("Дек пуст");
    }
    return _nums[_front];
  }

  /* Посмотреть последний элемент дека */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("Дек пуст");
    }
    // Вычислить индекс последнего элемента
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Вернуть список для вывода */
  List<int> toArray() {
    // Преобразовать только те элементы, которые сейчас находятся в деке
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Пример использования */
void main() {
  /* Инициализировать дек */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Дек deque = ${deque.toArray()}");

  /* Посмотреть первый и последний элементы */
  final int peekFirst = deque.peekFirst();
  print("Первый элемент дека peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("Последний элемент дека peekLast = $peekLast");

  /* Добавить элементы в дек */
  deque.pushLast(4);
  print("После добавления 4 в конец дека deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("После добавления 1 в начало дека deque = ${deque.toArray()}");

  /* Извлечь элементы из дека */
  final int popLast = deque.popLast();
  print("Извлечённый последний элемент = $popLast, после извлечения deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Извлечённый первый элемент = $popFirst, после извлечения deque = ${deque.toArray()}");

  /* Получить длину дека */
  final int size = deque.size();
  print("Длина дека size = $size");

  /* Проверить, пуст ли дек */
  final bool isEmpty = deque.isEmpty();
  print("Дек пуст = $isEmpty");
}
