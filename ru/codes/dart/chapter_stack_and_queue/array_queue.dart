/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
  late List<int> _nums; // Массив для хранения элементов очереди
  late int _front; // Индекс первого элемента очереди
  late int _queSize; // Длина очереди

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* Получить ёмкость очереди */
  int capaCity() {
    return _nums.length;
  }

  /* Получить длину очереди */
  int size() {
    return _queSize;
  }

  /* Проверить, пуста ли очередь */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Добавить элемент в очередь */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("Очередь заполнена");
    }
    // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
    // При выходе за конец массива операция взятия остатка возвращает rear в начало
    int rear = (_front + _queSize) % capaCity();
    // Добавить _num в конец очереди
    _nums[rear] = _num;
    _queSize++;
  }

  /* Извлечь элемент из очереди */
  int pop() {
    int _num = peek();
    // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Посмотреть первый элемент очереди */
  int peek() {
    if (isEmpty()) {
      throw Exception("Очередь пуста");
    }
    return _nums[_front];
  }

  /* Вернуть список */
  List<int> toArray() {
    // Преобразовать только те элементы, которые сейчас находятся в очереди
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Пример использования */
void main() {
  /* Инициализировать очередь */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* Добавить элементы в очередь */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Очередь queue = ${queue.toArray()}");

  /* Посмотреть первый элемент очереди */
  final int peek = queue.peek();
  print("Первый элемент очереди peek = $peek");

  /* Извлечь элемент из очереди */
  final int pop = queue.pop();
  print("Извлечённый элемент pop = $pop, после извлечения queue = ${queue.toArray()}");

  /* Получить длину очереди */
  final int size = queue.size();
  print("Длина очереди size = $size");

  /* Проверить, пуста ли очередь */
  final bool isEmpty = queue.isEmpty();
  print("Очередь пуста = $isEmpty");

  /* Проверить работу кольцевого массива */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("В цикле $i после добавления и извлечения элемента queue = ${queue.toArray()}");
  }
}
