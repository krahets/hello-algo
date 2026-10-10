/**
 * File: array_hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Пара ключ-значение */
class Pair {
  int key;
  String val;
  Pair(this.key, this.val);
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
  late List<Pair?> _buckets;

  ArrayHashMap() {
    // Инициализировать массив, содержащий 100 корзин
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
  /* Инициализация хеш-таблицы */
  final ArrayHashMap map = ArrayHashMap();

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
  String? name = map.get(15937);
  print("\nДля номера 15937 найдено имя $name");

  /* Операция удаления */
  // Удалить пару (key, value) из хеш-таблицы
  map.remove(10583);
  print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
  map.printHashMap();

  /* Обход хеш-таблицы */
  print("\nОтдельный обход пар ключ-значение");
  map.pairSet().forEach((kv) => print("${kv.key} -> ${kv.val}"));
  print("\nОтдельный обход ключей");
  map.keySet().forEach((key) => print("$key"));
  print("\nОтдельный обход значений");
  map.values().forEach((val) => print("$val"));
}
