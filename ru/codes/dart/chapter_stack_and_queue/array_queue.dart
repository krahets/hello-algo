/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Очередь на основе циклического массива */
class ArrayQueue {
  late List<int> _nums; // Массив для хранения элементов очереди
  late int _front; // Указатель front, указывающий на первый элемент очереди
  late int _queSize; // Длина очереди

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* Получить вместимость очереди */
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

  /* Поместить в очередь */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("очередьзаполнен");
    }
    // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
    // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
    int rear = (_front + _queSize) % capaCity();
    // Чтобы изменить _num Добавить в хвост очереди
    _nums[rear] = _num;
    _queSize++;
  }

  /* Извлечь из очереди */
  int pop() {
    int _num = peek();
    // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Получить элемент в начале очереди */
  int peek() {
    if (isEmpty()) {
      throw Exception("очередьпуст");
    }
    return _nums[_front];
  }

  /* Вернуть Array */
  List<int> toArray() {
    // Преобразовать только элементы списка в пределах действительной длины
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Инициализировать очередь */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* Поместить элемент в очередь */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("очередь queue = ${queue.toArray()}");

  /* Получить элемент в начале очереди */
  final int peek = queue.peek();
  print("элемент в голове очереди peek = $peek");

  /* Извлечь элемент из очереди */
  final int pop = queue.pop();
  print("Элемент, извлеченный из очереди, pop = $pop, queue после извлечения = ${queue.toArray()}");

  /* Получить длину очереди */
  final int size = queue.size();
  print("Длина очереди size = $size");

  /* Проверить, пуста ли очередь */
  final bool isEmpty = queue.isEmpty();
  print("очередьпуст ли = $isEmpty");

  /* Проверить кольцевой массив */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("Итерация $i: после enqueue + dequeue queue = ${queue.toArray()}");
  }
}
