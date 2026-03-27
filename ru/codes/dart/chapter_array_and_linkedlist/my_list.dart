/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Класс списка */
class MyList {
  late List<int> _arr; // Массив (для хранения элементов списка)
  int _capacity = 10; // Вместимость списка
  int _size = 0; // Длина списка (текущее число элементов)
  int _extendRatio = 2; // Коэффициент увеличения списка при каждом расширении

  /* Конструктор */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Получить длину списка (текущее число элементов) */
  int size() => _size;

  /* Получить вместимость списка */
  int capacity() => _capacity;

  /* Доступ к элементу */
  int get(int index) {
    if (index >= _size) throw RangeError('индекс выходит за границы');
    return _arr[index];
  }

  /* Обновление элемента */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('индекс выходит за границы');
    _arr[index] = _num;
  }

  /* Добавление элемента в конец */
  void add(int _num) {
    // При превышении вместимости по числу элементов запускается расширение
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Обновить число элементов
    _size++;
  }

  /* Вставка элемента в середину */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('индекс выходит за границы');
    // При превышении вместимости по числу элементов запускается расширение
    if (_size == _capacity) extendCapacity();
    // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Обновить число элементов
    _size++;
  }

  /* Удаление элемента */
  int remove(int index) {
    if (index >= _size) throw RangeError('индекс выходит за границы');
    int _num = _arr[index];
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Обновить число элементов
    _size--;
    // Вернуть удаленный элемент
    return _num;
  }

  /* Расширение списка */
  void extendCapacity() {
    // Создать новый массив длиной в _extendRatio раз больше исходного массива
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // Скопировать исходный массив в новый массив
    List.copyRange(_newNums, 0, _arr);
    // Обновить ссылку на _arr
    _arr = _newNums;
    // Обновить вместимость списка
    _capacity = _arr.length;
  }

  /* Преобразовать список в массив */
  List<int> toArray() {
    List<int> arr = [];
    for (var i = 0; i < _size; i++) {
      arr.add(get(i));
    }
    return arr;
  }
}

/* Driver Code */
void main() {
  /* Инициализация списка */
  MyList nums = MyList();
  /* Добавление элемента в конец */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'Список nums = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}');

  /* Вставка элемента в середину */
  nums.insert(3, 6);
  print('После вставки числа 6 по индексу 3 nums = ${nums.toArray()}');

  /* Удаление элемента */
  nums.remove(3);
  print('После удаления элемента по индексу 3 nums = ${nums.toArray()}');

  /* Доступ к элементу */
  int _num = nums.get(1);
  print('Элемент по индексу 1: _num = $_num');

  /* Обновление элемента */
  nums.set(1, 0);
  print('После обновления элемента по индексу 1 до 0 nums = ${nums.toArray()}');

  /* Проверка механизма расширения */
  for (var i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
    nums.add(i);
  }
  print(
      'Список nums после увеличения вместимости = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}');
}
