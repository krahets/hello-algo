/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Двусторонняя очередь на основе кольцевого массива */
class ArrayDeque {
  late List<int> _nums; // Массив для хранения элементов двусторонней очереди
  late int _front; // Указатель head, указывающий на первый элемент очереди
  late int _queSize; // Длина двусторонней очереди

  /* Конструктор */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* Получить вместимость двусторонней очереди */
  int capacity() {
    return _nums.length;
  }

  /* Получение длины двусторонней очереди */
  int size() {
    return _queSize;
  }

  /* Проверка, пуста ли двусторонняя очередь */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Вычислить индекс в кольцевом массиве */
  int index(int i) {
    // С помощью операции взятия по модулю соединить начало и конец массива
    // Когда i выходит за конец массива, он возвращается в начало
    // Когда i выходит за начало массива, он возвращается в конец
    return (i + capacity()) % capacity();
  }

  /* Добавление в голову очереди */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Двусторонняя очередь заполнена");
    }
    // Указатель головы сместить влево на одну позицию
    // С помощью операции взятия остатка реализовать возврат _front к хвосту после выхода за начало массива
    _front = index(_front - 1);
    // Добавить _num в голову очереди
    _nums[_front] = _num;
    _queSize++;
  }

  /* Добавление в хвост очереди */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("Двусторонняя очередь заполнена");
    }
    // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
    int rear = index(_front + _queSize);
    // Добавить _num в хвост очереди
    _nums[rear] = _num;
    _queSize++;
  }

  /* Извлечение из головы очереди */
  int popFirst() {
    int _num = peekFirst();
    // Указатель головы сместить вправо на одну позицию
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Извлечение из хвоста очереди */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Доступ к элементу в начале очереди */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("двусторонняя очередь пуста");
    }
    return _nums[_front];
  }

  /* Доступ к элементу в конце очереди */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("двусторонняя очередь пуста");
    }
    // Вычислить индекс хвостового элемента
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Вернуть массив для вывода */
  List<int> toArray() {
    // Преобразовывать только элементы списка в пределах фактической длины
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Инициализация двусторонней очереди */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Двусторонняя очередь deque = ${deque.toArray()}");

  /* Доступ к элементу */
  final int peekFirst = deque.peekFirst();
  print("Первый элемент peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("Последний элемент peekLast = $peekLast");

  /* Добавление элемента в очередь */
  deque.pushLast(4);
  print("После добавления элемента 4 в хвост deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("После добавления элемента 1 в голову deque = ${deque.toArray()}");

  /* Извлечение элемента из очереди */
  final int popLast = deque.popLast();
  print("Извлеченный из хвоста элемент = $popLast, deque после извлечения из хвоста = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Извлеченный из головы элемент = $popFirst, deque после извлечения из головы = ${deque.toArray()}");

  /* Получение длины двусторонней очереди */
  final int size = deque.size();
  print("Длина двусторонней очереди size = $size");

  /* Проверка, пуста ли двусторонняя очередь */
  final bool isEmpty = deque.isEmpty();
  print("Пуста ли двусторонняя очередь = $isEmpty");
}
