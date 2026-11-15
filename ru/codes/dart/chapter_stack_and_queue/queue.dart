/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_queue}
  /* Инициализация очереди */
  // В Dart двусторонняя очередь Queue обычно рассматривается как обычная очередь
  final Queue<int> queue = Queue();
  // [endregion]{init_queue}

  // [region]{push}
  /* Добавление элемента в очередь */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  // [endregion]{push}
  print("Очередь queue = $queue");

  // [region]{peek}
  /* Доступ к элементу в начале очереди */
  final int peek = queue.first;
  // [endregion]{peek}
  print("Первый элемент peek = $peek");

  // [region]{pop}
  /* Извлечение элемента из очереди */
  final int pop = queue.removeFirst();
  // [endregion]{pop}
  print("Извлеченный элемент pop = $pop, queue после извлечения = $queue");

  // [region]{size}
  /* Получить длину очереди */
  final int size = queue.length;
  // [endregion]{size}
  print("Длина очереди size = $size");

  // [region]{is_empty}
  /* Проверка, пуста ли очередь */
  final bool isEmpty = queue.isEmpty;
  // [endregion]{is_empty}
  print("Пуста ли очередь = $isEmpty");
}
