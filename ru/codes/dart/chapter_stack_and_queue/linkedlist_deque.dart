/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Узел двусвязного списка */
class ListNode {
  int val; // Значение узла
  ListNode? next; // Ссылка на узел-преемник
  ListNode? prev; // Ссылка на узел-предшественник

  ListNode(this.val, {this.next, this.prev});
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
  late ListNode? _front; // Головной узел _front
  late ListNode? _rear; // Хвостовой узел _rear
  int _queSize = 0; // Длина двусторонней очереди

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* Получить длину двусторонней очереди */
  int size() {
    return this._queSize;
  }

  /* Проверка, пуста ли двусторонняя очередь */
  bool isEmpty() {
    return size() == 0;
  }

  /* Операция добавления в очередь */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // Если связный список пуст, пусть _front и _rear оба указывают на node
      _front = _rear = node;
    } else if (isFront) {
      // Операция добавления в голову очереди
      // Добавить node в начало связного списка
      _front!.prev = node;
      node.next = _front;
      _front = node; // Обновить головной узел
    } else {
      // Операция добавления в хвост очереди
      // Добавить node в конец связного списка
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Обновить хвостовой узел
    }
    _queSize++; // Обновить длину очереди
  }

  /* Добавление в голову очереди */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Добавление в хвост очереди */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* Операция извлечения из очереди */
  int? pop(bool isFront) {
    // Если очередь пуста, сразу вернуть null
    if (isEmpty()) {
      return null;
    }
    final int val;
    if (isFront) {
      // Операция извлечения из головы очереди
      val = _front!.val; // Временно сохранить значение головного узла
      // Удалить головной узел
      ListNode? fNext = _front!.next;
      if (fNext != null) {
        fNext.prev = null;
        _front!.next = null;
      }
      _front = fNext; // Обновить головной узел
    } else {
      // Операция извлечения из хвоста очереди
      val = _rear!.val; // Временно сохранить значение хвостового узла
      // Удалить хвостовой узел
      ListNode? rPrev = _rear!.prev;
      if (rPrev != null) {
        rPrev.next = null;
        _rear!.prev = null;
      }
      _rear = rPrev; // Обновить хвостовой узел
    }
    _queSize--; // Обновить длину очереди
    return val;
  }

  /* Извлечение из головы очереди */
  int? popFirst() {
    return pop(true);
  }

  /* Извлечение из хвоста очереди */
  int? popLast() {
    return pop(false);
  }

  /* Доступ к элементу в начале очереди */
  int? peekFirst() {
    return _front?.val;
  }

  /* Доступ к элементу в конце очереди */
  int? peekLast() {
    return _rear?.val;
  }

  /* Вернуть массив для вывода */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> res = [];
    for (int i = 0; i < _queSize; i++) {
      res.add(node!.val);
      node = node.next;
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Инициализация двусторонней очереди */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Двусторонняя очередь deque = ${deque.toArray()}");

  /* Доступ к элементу */
  int? peekFirst = deque.peekFirst();
  print("Первый элемент peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("Последний элемент peekLast = $peekLast");

  /* Добавление элемента в очередь */
  deque.pushLast(4);
  print("После добавления элемента 4 в хвост deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("После добавления элемента 1 в голову deque = ${deque.toArray()}");

  /* Извлечение элемента из очереди */
  int? popLast = deque.popLast();
  print("Извлеченный из хвоста элемент = $popLast, deque после извлечения из хвоста = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Извлеченный из головы элемент = $popFirst, deque после извлечения из головы = ${deque.toArray()}");

  /* Получение длины двусторонней очереди */
  int size = deque.size();
  print("Длина двусторонней очереди size = $size");

  /* Проверка, пуста ли двусторонняя очередь */
  bool isEmpty = deque.isEmpty();
  print("Пуста ли двусторонняя очередь = $isEmpty");
}
