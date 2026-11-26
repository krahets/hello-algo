/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Пара «ключ — значение» */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // Создать массив из 100 корзин
    _buckets = List.filled(100, null);
  }

  /* Хеш-функция */
  int _hashFunc(int key) {
    final int index = key % 100;
    return index;
  }

  /* Поиск */
  String? get(int key) {
    final int index = _hashFunc(key);
    final Pair? pair = _buckets[index];
    if (pair == null) {
      return null;
    }
    return pair.val;
  }

  /* Вставка */
  void put(int key, String val) {
    final Pair pair = Pair(key, val);
    final int index = _hashFunc(key);
    _buckets[index] = pair;
  }

  /* Удаление */
  void remove(int key) {
    final int index = _hashFunc(key);
    _buckets[index] = null;
  }

  /* Получить все пары «ключ — значение» */
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

/* Демонстрационный код */
void main() {
  /* Создать хеш-таблицу */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\nИмя студента с номером 15937: $name");

  /* Удаление */
  // Удалить из таблицы пару (key, value)
  map.remove(10583);
  print("\nХеш-таблица после удаления 10583:\nКлюч -> Значение");
  map.printHashMap();

  /* Обход хеш-таблицы */
  print("\nОбход пар «ключ -> значение»");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nОбход только ключей");
  map.keySet().forEach((key) => print("$key"));
  print("\nОбход только значений");
  map.values().forEach((val) => print("$val"));
}
