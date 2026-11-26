/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Класс списка */
class MyList {
  late List<int> _arr; // Массив для хранения элементов списка
  int _capacity = 10; // Ёмкость списка
  int _size = 0; // Длина списка (текущее количество элементов)
  int _extendRatio = 2; // Коэффициент увеличения ёмкости списка

  /* Конструктор */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Получить длину списка (текущее количество элементов)*/
  int size() => _size;

  /* Получить ёмкость списка */
  int capacity() => _capacity;

  /* Доступ к элементу */
  int get(int index) {
    if (index >= _size) throw RangeError('Индекс за пределами списка');
    return _arr[index];
  }

  /* Изменение элемента */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('Индекс за пределами списка');
    _arr[index] = _num;
  }

  /* Добавление элемента в конец */
  void add(int _num) {
    // Если для элементов не хватает места, увеличить ёмкость
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Обновить количество элементов
    _size++;
  }

  /* Вставка элемента в середину */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('Индекс за пределами списка');
    // Если для элементов не хватает места, увеличить ёмкость
    if (_size == _capacity) extendCapacity();
    // Сдвинуть все элементы начиная с index на одну позицию вправо
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Обновить количество элементов
    _size++;
  }

  /* Удаление элемента */
  int remove(int index) {
    if (index >= _size) throw RangeError('Индекс за пределами списка');
    int _num = _arr[index];
    // Сдвинуть все элементы после index на одну позицию влево
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Обновить количество элементов
    _size--;
    // Вернуть удалённый элемент
    return _num;
  }

  /* Увеличение ёмкости списка */
  void extendCapacity() {
    // Создать массив, длина которого в _extendRatio раз больше длины исходного
    final _newNums = List.filled(_capacity * _extendRatio, 0);
    // Скопировать исходный массив в новый
    List.copyRange(_newNums, 0, _arr);
    // Обновить ссылку _arr
    _arr = _newNums;
    // Обновить ёмкость списка
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

/* Демонстрационный код */
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
      'Список nums = ${nums.toArray()}, ёмкость = ${nums.capacity()}, длина = ${nums.size()}');

  /* Вставка элемента в середину */
  nums.insert(3, 6);
  print('После вставки числа 6 по индексу 3 nums = ${nums.toArray()}');

  /* Удаление элемента */
  nums.remove(3);
  print('После удаления элемента по индексу 3 nums = ${nums.toArray()}');

  /* Доступ к элементу */
  int _num = nums.get(1);
  print('Элемент по индексу 1: _num = $_num');

  /* Изменение элемента */
  nums.set(1, 0);
  print('После записи 0 по индексу 1 nums = ${nums.toArray()}');

  /* Проверка увеличения ёмкости */
  for (var i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
    nums.add(i);
  }
  print(
      'После увеличения ёмкости список nums = ${nums.toArray()}, ёмкость = ${nums.capacity()}, длина = ${nums.size()}');
}
