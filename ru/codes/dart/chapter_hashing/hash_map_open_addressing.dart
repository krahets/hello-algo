/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
  late int _size; // Число пар «ключ — значение»
  int _capacity = 4; // Ёмкость хеш-таблицы
  double _loadThres = 2.0 / 3.0; // Порог коэффициента заполнения для расширения
  int _extendRatio = 2; // Во сколько раз увеличивается ёмкость
  late List<Pair?> _buckets; // Массив корзин
  Pair _TOMBSTONE = Pair(-1, "-1"); // Метка удаления

  /* Конструктор */
  HashMapOpenAddressing() {
    _size = 0;
    _buckets = List.generate(_capacity, (index) => null);
  }

  /* Хеш-функция */
  int hashFunc(int key) {
    return key % _capacity;
  }

  /* Коэффициент заполнения */
  double loadFactor() {
    return _size / _capacity;
  }

  /* Найти индекс корзины для ключа key */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    for (int i = 0; i < _capacity; i++) {
      final bucket = _buckets[index];
      if (bucket == null) break;
      // Запомнить первую встретившуюся метку удаления
      if (identical(bucket, _TOMBSTONE)) {
        if (firstTombstone == -1) firstTombstone = index;
      } else if (bucket.key == key) {
        // Если ранее встретилась метка удаления, переместить пару на её место
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = bucket;
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // Вернуть индекс корзины после перемещения
        }
        return index; // Вернуть индекс корзины
      }
      // Вычислить индекс корзины, после конца массива перейти в начало
      index = (index + 1) % _capacity;
    }
    // Если ключа key нет, вернуть индекс для вставки
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* Поиск */
  String? get(int key) {
    // Найти индекс корзины для ключа key
    int index = findBucket(key);
    // Если пара найдена, вернуть её значение val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // Если пары нет, вернуть null
    return null;
  }

  /* Вставка */
  void put(int key, String val) {
    // Расширить таблицу, если коэффициент заполнения превысил порог
    if (loadFactor() > _loadThres) {
      extend();
    }
    // Найти индекс корзины для ключа key
    int index = findBucket(key);
    // Если пара найдена, заменить val и завершить операцию
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // Если пары нет, добавить её
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* Удаление */
  void remove(int key) {
    // Найти индекс корзины для ключа key
    int index = findBucket(key);
    // Если пара найдена, заменить её меткой удаления
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* Расширить хеш-таблицу */
  void extend() {
    // Временно сохранить исходную хеш-таблицу
    List<Pair?> bucketsTmp = _buckets;
    // Создать новую таблицу увеличенной ёмкости
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // Перенести пары из исходной таблицы в новую
    for (Pair? pair in bucketsTmp) {
      if (pair != null && pair != _TOMBSTONE) {
        put(pair.key, pair.val);
      }
    }
  }

  /* Вывести хеш-таблицу */
  void printHashMap() {
    for (Pair? pair in _buckets) {
      if (pair == null) {
        print("null");
      } else if (pair == _TOMBSTONE) {
        print("TOMBSTONE");
      } else {
        print("${pair.key} -> ${pair.val}");
      }
    }
  }
}

/* Демонстрационный код */
void main() {
  /* Создать хеш-таблицу */
  HashMapOpenAddressing map = HashMapOpenAddressing();

  /* Вставка */
  // Добавить в таблицу пару (key, value)
  map.put(12836, "Сяо Ха");
  map.put(15937, "Сяо Ло");
  map.put(16750, "Сяо Суань");
  map.put(13276, "Сяо Фа");
  map.put(10583, "Сяо Я");
  print("\nХеш-таблица после вставки:\nКлюч -> Значение");
  map.printHashMap();

  /* Поиск */
  // Получить из таблицы значение value по ключу key
  String? name = map.get(13276);
  print("\nИмя студента с номером 13276: $name");

  /* Удаление */
  // Удалить из таблицы пару (key, value)
  map.remove(16750);
  print("\nХеш-таблица после удаления 16750:\nКлюч -> Значение");
  map.printHashMap();
}
