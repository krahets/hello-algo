/**
 * File: hash_map_open_addressing.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
  late int _size; // Число пар ключ-значение
  int _capacity = 4; // Вместимость хеш-таблицы
  double _loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
  int _extendRatio = 2; // Коэффициент расширения
  late List<Pair?> _buckets; // Массив корзин
  Pair _TOMBSTONE = Pair(-1, "-1"); // Удалить метку

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

  /* Найти индекс корзины, соответствующий key */
  int findBucket(int key) {
    int index = hashFunc(key);
    int firstTombstone = -1;
    // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
    while (_buckets[index] != null) {
      // Если встретился key, вернуть соответствующий индекс корзины
      if (_buckets[index]!.key == key) {
        // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
        if (firstTombstone != -1) {
          _buckets[firstTombstone] = _buckets[index];
          _buckets[index] = _TOMBSTONE;
          return firstTombstone; // Вернуть индекс корзины после перемещения
        }
        return index; // Вернуть индекс корзины
      }
      // Записать первую встретившуюся метку удаления
      if (firstTombstone == -1 && _buckets[index] == _TOMBSTONE) {
        firstTombstone = index;
      }
      // Вычислить индекс корзины; при выходе за конец вернуться к началу
      index = (index + 1) % _capacity;
    }
    // Если key не существует, вернуть индекс точки добавления
    return firstTombstone == -1 ? index : firstTombstone;
  }

  /* Операция поиска */
  String? get(int key) {
    // Найти индекс корзины, соответствующий key
    int index = findBucket(key);
    // Если пара ключ-значение найдена, вернуть соответствующее val
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      return _buckets[index]!.val;
    }
    // Если пары ключ-значение не существует, вернуть null
    return null;
  }

  /* Операция добавления */
  void put(int key, String val) {
    // Когда коэффициент загрузки превышает порог, выполнить расширение
    if (loadFactor() > _loadThres) {
      extend();
    }
    // Найти индекс корзины, соответствующий key
    int index = findBucket(key);
    // Если пара ключ-значение найдена, перезаписать val и вернуть
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index]!.val = val;
      return;
    }
    // Если пары ключ-значение нет, добавить ее
    _buckets[index] = new Pair(key, val);
    _size++;
  }

  /* Операция удаления */
  void remove(int key) {
    // Найти индекс корзины, соответствующий key
    int index = findBucket(key);
    // Если пара ключ-значение найдена, заменить ее меткой удаления
    if (_buckets[index] != null && _buckets[index] != _TOMBSTONE) {
      _buckets[index] = _TOMBSTONE;
      _size--;
    }
  }

  /* Расширить хеш-таблицу */
  void extend() {
    // Временно сохранить исходную хеш-таблицу
    List<Pair?> bucketsTmp = _buckets;
    // Инициализация новой хеш-таблицы после расширения
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
  /* Инициализация хеш-таблицы */
  HashMapOpenAddressing map = HashMapOpenAddressing();

  /* Операция добавления */
  // Добавить пару (key, value) в хеш-таблицу
  map.put(12836, "Сяо Ха");
  map.put(15937, "Сяо Ло");
  map.put(16750, "Сяо Суань");
  map.put(13276, "Сяо Фа");
  map.put(10583, "Сяо Я");
  print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
  map.printHashMap();

  /* Операция поиска */
  // Ввести в хеш-таблицу ключ key и получить значение value
  String? name = map.get(13276);
  print("\nДля номера 13276 найдено имя $name");

  /* Операция удаления */
  // Удалить пару (key, value) из хеш-таблицы
  map.remove(16750);
  print("\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение");
  map.printHashMap();
}
