/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Двусторонняя очередь на основе циклического массива */
class ArrayDeque {
  late List<int> _nums; // Массив для хранения элементов двусторонней очереди
  late int _front; // Указатель front, указывающий на первый элемент очереди
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

  /* Получить длину двусторонней очереди */
  int size() {
    return _queSize;
  }

  /* Проверить, пуста ли двусторонняя очередь */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Вычислить индекс циклического массива */
  int index(int i) {
    // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
    // Когда i выходит за конец массива, он возвращается к началу
    // Когда i выходит за начало массива, он возвращается к концу
    return (i + capacity()) % capacity();
  }

  /* Поместить в голову очереди */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("двусторонняя очередьзаполнен");
    }
    // Указатель головы очереди сдвигается на одну позицию влево
    // С помощью операции взятия по модулю _front после выхода за начало массива возвращается к его концу
    _front = index(_front - 1);
    // Чтобы изменить _num Добавить в голову очереди
    _nums[_front] = _num;
    _queSize++;
  }

  /* Поместить в хвост очереди */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("двусторонняя очередьзаполнен");
    }
    // Вычислить указатель хвоста, указывающий на индекс за последним элементом
    int rear = index(_front + _queSize);
    // Чтобы изменить _num Добавить в хвост очереди
    _nums[rear] = _num;
    _queSize++;
  }

  /* Извлечь из головы очереди */
  int popFirst() {
    int _num = peekFirst();
    // Указатель головы очереди сдвигается на одну позицию вправо
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* Извлечь из хвоста очереди */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* Получить элемент в начале очереди */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("двусторонняя очередьпуст");
    }
    return _nums[_front];
  }

  /* Обратиться к элементу в хвосте очереди */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("двусторонняя очередьпуст");
    }
    // Вычислить индекс хвостового элемента
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* Вернуть массив для печати */
  List<int> toArray() {
    // Преобразовать только элементы списка в пределах действительной длины
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Инициализировать двустороннюю очередь */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("двусторонняя очередь deque = ${deque.toArray()}");

  /* Получить доступ к элементу */
  final int peekFirst = deque.peekFirst();
  print("элемент в голове очереди peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("элемент в хвосте очереди peekLast = $peekLast");

  /* Поместить элемент в очередь */
  deque.pushLast(4);
  print("После помещения элемента 4 в хвост очереди deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("После помещения элемента 1 в голову очереди deque = ${deque.toArray()}");

  /* Извлечь элемент из очереди */
  final int popLast = deque.popLast();
  print("Элемент, извлеченный из хвоста очереди, = $popLast, deque после извлечения из хвоста = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("Элемент, извлеченный из головы очереди, = $popFirst, deque после извлечения из головы = ${deque.toArray()}");

  /* Получить длину двусторонней очереди */
  final int size = deque.size();
  print("Длина двусторонней очереди size = $size");

  /* Проверить, пуста ли двусторонняя очередь */
  final bool isEmpty = deque.isEmpty();
  print("двусторонняя очередьпуст ли = $isEmpty");
}
