/**
 * File: my_list.dart
 * Created Time: 2023-02-05
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Класс списка */
class MyList {
  late List<int> _arr; // Массив (хранит элементы списка)
  int _capacity = 10; // Вместимость списка
  int _size = 0; // Длина списка (текущее количество элементов)
  int _extendRatio = 2; // Коэффициент расширения списка при каждом увеличении

  /* Конструктор */
  MyList() {
    _arr = List.filled(_capacity, 0);
  }

  /* Получить длину списка (текущее количество элементов) */
  int size() => _size;

  /* Получить вместимость списка */
  int capacity() => _capacity;

  /* Получить доступ к элементу */
  int get(int index) {
    if (index >= _size) throw RangeError('индексвыходит за границы');
    return _arr[index];
  }

  /* Обновить элемент */
  void set(int index, int _num) {
    if (index >= _size) throw RangeError('индексвыходит за границы');
    _arr[index] = _num;
  }

  /* Добавить элемент в конец */
  void add(int _num) {
    // Если число элементов превышает вместимость, запустить механизм расширения
    if (_size == _capacity) extendCapacity();
    _arr[_size] = _num;
    // Обновить количество элементов
    _size++;
  }

  /* Вставить элемент в середину */
  void insert(int index, int _num) {
    if (index >= _size) throw RangeError('индексвыходит за границы');
    // Если число элементов превышает вместимость, запустить механизм расширения
    if (_size == _capacity) extendCapacity();
    // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
    for (var j = _size - 1; j >= index; j--) {
      _arr[j + 1] = _arr[j];
    }
    _arr[index] = _num;
    // Обновить количество элементов
    _size++;
  }

  /* Удалить элемент */
  int remove(int index) {
    if (index >= _size) throw RangeError('индексвыходит за границы');
    int _num = _arr[index];
    // Сдвинуть на одну позицию вперед все элементы после индекса index
    for (var j = index; j < _size - 1; j++) {
      _arr[j] = _arr[j + 1];
    }
    // Обновить количество элементов
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
    // Обновить ссылку _arr
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
  /* Инициализировать список */
  MyList nums = MyList();
  /* Добавить элемент в конец */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print(
      'список nums = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}');

  /* Вставить элемент в середину */
  nums.insert(3, 6);
  print('После вставки числа 6 по индексу 3 получаем nums = ${nums.toArray()}');

  /* Удалить элемент */
  nums.remove(3);
  print('После удаления элемента по индексу 3 получаем nums = ${nums.toArray()}');

  /* Получить доступ к элементу */
  int _num = nums.get(1);
  print('обратиться киндекс 1 поэлемент, получаем _num = $_num');

  /* Обновить элемент */
  nums.set(1, 0);
  print('После обновления элемента по индексу 1 на 0 получаем nums = ${nums.toArray()}');

  /* Проверить механизм расширения */
  for (var i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
    nums.add(i);
  }
  print(
      'Список nums после расширения = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}');
}
