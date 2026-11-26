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

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
  late ListNode? _front; // Первый узел _front
  late ListNode? _rear; // Последний узел _rear
  int _queSize = 0; // Длина дека

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* Получить длину дека */
  int size() {
    return this._queSize;
  }

  /* Проверить, пуст ли дек */
  bool isEmpty() {
    return size() == 0;
  }

  /* Добавить элемент в дек */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // Если связный список пуст, установить _front и _rear так, чтобы они указывали на node
      _front = _rear = node;
    } else if (isFront) {
      // Добавить элемент в начало дека
      // Добавить node в начало связного списка
      _front!.prev = node;
      node.next = _front;
      _front = node; // Обновить ссылку на первый узел
    } else {
      // Добавить элемент в конец дека
      // Добавить node в конец связного списка
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // Обновить ссылку на последний узел
    }
    _queSize++; // Обновить длину дека
  }

  /* Добавить элемент в начало дека */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* Добавить элемент в конец дека */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* Извлечь элемент из дека */
  int? pop(bool isFront) {
    // Если дек пуст, сразу вернуть null
    if (isEmpty()) {
      return null;
    }
    final int val;
    // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // Извлечь элемент из начала дека
    else if (isFront) {
      val = _front!.val; // Временно сохранить значение первого узла
      // Удалить первый узел
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // Обновить ссылку на первый узел
    // Извлечь элемент из конца дека
    } else {
      val = _rear!.val; // Временно сохранить значение последнего узла
      // Удалить последний узел
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // Обновить ссылку на последний узел
    }
    _queSize--; // Обновить длину дека
    return val;
  }

  /* Извлечь элемент из начала дека */
  int? popFirst() {
    return pop(true);
  }

  /* Извлечь элемент из конца дека */
  int? popLast() {
    return pop(false);
  }

  /* Посмотреть первый элемент дека */
  int? peekFirst() {
    return _front?.val;
  }

  /* Посмотреть последний элемент дека */
  int? peekLast() {
    return _rear?.val;
  }

  /* Вернуть список для вывода */
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

/* Пример использования */
void main() {
  /* Инициализировать дек */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("Дек deque = ${deque.toArray()}");

  /* Посмотреть первый и последний элементы */
  int? peekFirst = deque.peekFirst();
  print("Первый элемент дека peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("Последний элемент дека peekLast = $peekLast");

  /* Добавить элементы в дек */
  deque.pushLast(4);
  print("После добавления 4 в конец дека deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("После добавления 1 в начало дека deque = ${deque.toArray()}");

  /* Извлечь элементы из дека */
  int? popLast = deque.popLast();
  print("Извлечённый последний элемент = $popLast, после извлечения deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("Извлечённый первый элемент = $popFirst, после извлечения deque = ${deque.toArray()}");

  /* Получить длину дека */
  int size = deque.size();
  print("Длина дека size = $size");

  /* Проверить, пуст ли дек */
  bool isEmpty = deque.isEmpty();
  print("Дек пуст = $isEmpty");
}
