/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
  late List<int> _nums; // Массив для хранения элементов очереди
  late int _front; // Указатель head, указывающий на первый элемент очереди
  late int _queSize; // Длина очереди

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* Получить вместимость очереди */
  int capaCity() {
    return _nums.length;
  }

  /* Получение длины очереди */
  int size() {
    return _queSize;
  }

  /* Проверка, пуста ли очередь */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Поместить в очередь */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("Очередь заполнена");
    }
    // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
    // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
    int rear = (_front + _queSize) % capaCity();
    // Добавить _num в хвост очереди
    _nums[rear] = _num;
    _queSize++;
  }

  /* Извлечь из очереди */
  int pop() {
    int _num = peek();
    // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* Доступ к элементу в начале очереди */
  int peek() {
    if (isEmpty()) {
      throw Exception("очередь пуста");
    }
    return _nums[_front];
  }

  /* Вернуть Array */
  List<int> toArray() {
    // Преобразовывать только элементы списка в пределах фактической длины
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* Инициализация очереди */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* Добавление элемента в очередь */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Очередь queue = ${queue.toArray()}");

  /* Доступ к элементу в начале очереди */
  final int peek = queue.peek();
  print("Первый элемент peek = $peek");

  /* Извлечение элемента из очереди */
  final int pop = queue.pop();
  print("Извлеченный элемент pop = $pop, queue после извлечения = ${queue.toArray()}");

  /* Получить длину очереди */
  final int size = queue.size();
  print("Длина очереди size = $size");

  /* Проверка, пуста ли очередь */
  final bool isEmpty = queue.isEmpty();
  print("Пуста ли очередь = $isEmpty");

  /* Проверка кольцевого массива */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("После $i-го раунда операций enqueue и dequeue queue = ${queue.toArray()}");
  }
}
