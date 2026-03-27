/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* пара ключ-значение */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // Инициализировать массив, содержащий 100 бакетов
    _buckets = List.filled(100, null);
  }

  /* Хеш-функция */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* Операция поиска */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* Операция добавления */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* Операция удаления */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* Получить все пары ключ-значение */
  List<Pair> pairSet() {
    List<Pair> pairSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        pairSet.add(pair);
      }
    }
    return pairSet;
  }

  /* Получить все ключи */
  List<int> keySet() {
    List<int> keySet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        keySet.add(pair.key);
      }
    }
    return keySet;
  }

  /* Получить все значения */
  List<String> values() {
    List<String> valueSet = [];
    for (final Pair? pair in _buckets) {
      if (pair != null) {
        valueSet.add(pair.val);
      }
    }
    return valueSet;
  }

  /* Вывести хеш-таблицу */
  void printHashMap() {
    for (final Pair kv in pairSet()) {
      print("${kv.key} -> ${kv.val}");
    }
  }
}

/* Driver Code */
void main() {
  /* Инициализировать хеш-таблицу */
  final ArrayHashMap map = ArrayHashMap();

  /* Операция добавления */
  // Добавить в хеш-таблицу пару ключ-значение (key, value)
  map.put(12836, "Сяо Ха");
  map.put(15937, "Сяо Ло");
  map.put(16750, "Сяо Суань");
  map.put(13276, "Сяо Фа");
  map.put(10583, "Утенок");
  print("\nПосле добавления хеш-таблица выглядит так\nKey -> Value");
  map.printHashMap();

  /* Операция поиска */
  // Передать ключ key в хеш-таблицу и получить значение value
  String? name = map.get(15937);
  print("\nПо номеру студента 15937 найдено имя $name");

  /* Операция удаления */
  // Удалить из хеш-таблицы пару ключ-значение (key, value)
  map.remove(10583);
  print("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value");
  map.printHashMap();

  /* Перебрать хеш-таблицу */
  print("\nПеребираем пары Key->Value");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nОтдельно перебираем ключи Key");
  map.keySet().forEach((key) => print("$key"));
  print("\nОтдельно перебираем значения Value");
  map.values().forEach((val) => print("$val"));
}
