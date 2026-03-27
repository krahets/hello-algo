/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Узел двусвязного списка */
class ListNode {
  int val; // Значение узла
  ListNode? next; // Ссылка на следующий узел
  ListNode? prev; // Ссылка на предыдущий узел

  ListNode(this.val, {this.next, this.prev});
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
  late ListNode? _front; // головной узел _front
  late ListNode? _rear; // хвостовой узел _rear
  int _queSize = 0; // Длина двусторонней очереди

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* ПолучитьДлина двусторонней очереди */
  int size() {
    return this._queSize;
  }

  /* Проверить, пуста ли двусторонняя очередь */
  bool isEmpty() {
    return size() == 0;
  }

  /* Операция помещения в очередь */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // Если связный список пуст, сделать так, чтобы и _front, и _rear указывали на node
      _front = _rear = node;
    } else if (isFront) {
      // Операция помещения в голову очереди
      // Добавить node в голову связного списка
      _front!.prev = node;
      node.next = _front;
      _front = node; // Обновить головной узел
    } else {
      // Операция помещения в хвост очереди
      // Добавить node в хвост связного списка
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Обновить хвостовой узел
    }
    _queSize++; // ОбновитьДлина очереди
  }

  /* Поместить в голову очереди */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Поместить в хвост очереди */
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
    _queSize--; // ОбновитьДлина очереди
    return val;
  }

  /* Извлечь из головы очереди */
  int? popFirst() {
    return pop(true);
  }

  /* Извлечь из хвоста очереди */
  int? popLast() {
    return pop(false);
  }

  /* Получить элемент в начале очереди */
  int? peekFirst() {
    return _front?.val;
  }

  /* Обратиться к элементу в хвосте очереди */
  int? peekLast() {
    return _rear?.val;
  }

  /* Вернуть массив для печати */
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
  /* Инициализировать двустороннюю очередь */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("двусторонняя очередь deque = ${deque.toArray()}");

  /* Получить доступ к элементу */
  int? peekFirst = deque.peekFirst();
  print("голова очередиэлемент peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("хвост очередиэлемент peekLast = $peekLast");

  /* Поместить элемент в очередь */
  deque.pushLast(4);
  print("После помещения элемента 4 в хвост очереди deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("После помещения элемента 1 в голову очереди deque = ${deque.toArray()}");

  /* Извлечь элемент из очереди */
  int? popLast = deque.popLast();
  print("Элемент, извлеченный из хвоста очереди = $popLast , deque после извлечения из хвоста = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Элемент, извлеченный из головы очереди = $popFirst , deque после извлечения из головы = ${deque.toArray()}");

  /* Получить длину двусторонней очереди */
  int size = deque.size();
  print("Длина двусторонней очереди size = $size");

  /* Проверить, пуста ли двусторонняя очередь */
  bool isEmpty = deque.isEmpty();
  print("Двусторонняя очередь пуста: $isEmpty");
}
