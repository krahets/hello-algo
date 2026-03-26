/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
  late int _size; // Количество пар ключ-значение
  int _capacity = 4; // Вместимость хеш-таблицы
  double _loadThres = 2.0 / 3.0; // Порог коэффициента загрузки, запускающий расширение
  int _extendRatio = 2; // Коэффициент расширения
  late List<Pair?> _buckets; // Массив бакетов
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

  /* Коэффициент загрузки */
  double loadFactor() {
    return _size / _capacity;
  }

  /* Найти индекс корзины, соответствующей ключу key */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // Выполнять линейное пробирование и остановиться при встрече с пустым бакетом
    while (_buckets[index] != null) {
      // Если встретился key, вернуть соответствующий индекс бакета
      if (_buckets[index]!.key == key) {
        // Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // Вернуть индекс бакета после перемещения
        }
        return index; // Вернуть индекс бакета
      }
      // Записать первую встретившуюся метку удаления
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // Вычислить индекс бакета; при выходе за конец вернуться к началу
      index = (index + 1) % _capacity;
    }
    // Если key не существует, вернуть индекс точки добавления
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* Операция поиска */
  String? get(int key) {
    // Найти индекс корзины, соответствующей ключу key
    int index = findBucket(key);
    // Если пара ключ-значение найдена, вернуть соответствующее val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // Если пара ключ-значение не существует, вернуть null
    return null;
  }

  /* Операция добавления */
  void put(int key, String val) {
    // Когда коэффициент загрузки превышает порог, выполнить расширение
    if (loadFactor() > _loadThres) {
      extend();
    }
    // Найти индекс корзины, соответствующей ключу key
    int index = findBucket(key);
    // Если пара ключ-значение найдена, перезаписать val и вернуть результат
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // Если пара ключ-значение не существует, добавить ее
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* Операция удаления */
  void remove(int key) {
    // Найти индекс корзины, соответствующей ключу key
    int index = findBucket(key);
    // Если пара ключ-значение найдена, пометить ее меткой удаления
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* Расширить хеш-таблицу */
  void extend() {
    // Временно сохранить исходную хеш-таблицу
    List<Pair?> bucketsTmp = _buckets;
    // Инициализировать новую хеш-таблицу после расширения
    _capacity *= _extendRatio;
    _buckets = List.generate(_capacity, (index) => null);
    _size = 0;
    // Перенести пары ключ-значение из исходной хеш-таблицы в новую
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

/* Driver Code */
void main() {
  /* Инициализировать хеш-таблицу */
  HashMapOpenAddressing map = HashMapOpenAddressing();

  /* Операция добавления */
  // Добавить в хеш-таблицу пару ключ-значение (key, value)
  map.put(12836, "Сяо Ха");
  map.put(15937, "Сяо Ло");
  map.put(16750, "Сяо Суань");
  map.put(13276, "Сяо Фа");
  map.put(10583, "Утенок");
  print("\nПосле добавления хеш-таблица имеет вид\nKey -> Value");
  map.printHashMap();

  /* Операция поиска */
  // Передать ключ key в хеш-таблицу и получить значение value
  String? name = map.get(13276);
  print("\nВходномер 13276, найденоимя $name");

  /* Операция удаления */
  // Удалить из хеш-таблицы пару ключ-значение (key, value)
  map.remove(16750);
  print("\nПосле удаления 16750 хеш-таблица имеет вид\nKey -> Value");
  map.printHashMap();
}
