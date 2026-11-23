/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Хеш-таблица с цепочками */
class HashMapChaining {
  late int size; // Число пар ключ-значение
  late int capacity; // Вместимость хеш-таблицы
  late double loadThres; // Порог коэффициента загрузки для запуска расширения
  late int extendRatio; // Коэффициент расширения
  late List<List<Pair>> buckets; // Массив корзин

  /* Конструктор */
  HashMapChaining() {
    size = 0;
    capacity = 4;
    loadThres = 2.0 / 3.0;
    extendRatio = 2;
    buckets = List.generate(capacity, (_) => []);
  }

  /* Хеш-функция */
  int hashFunc(int key) {
    return key % capacity;
  }

  /* Коэффициент загрузки */
  double loadFactor() {
    return size / capacity;
  }

  /* Операция поиска */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Обойти корзину; если найден key, вернуть соответствующее val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // Если key не найден, вернуть null
    return null;
  }

  /* Операция добавления */
  void put(int key, String val) {
    // Когда коэффициент загрузки превышает порог, выполнить расширение
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // Если такого key нет, добавить пару ключ-значение в конец
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* Операция удаления */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Обойти корзину и удалить из нее пару ключ-значение
    for (Pair pair in bucket) {
      if (pair.key == key) {
        bucket.remove(pair);
        size--;
        break;
      }
    }
  }

  /* Расширить хеш-таблицу */
  void extend() {
    // Временно сохранить исходную хеш-таблицу
    List<List<Pair>> bucketsTmp = buckets;
    // Инициализация новой хеш-таблицы после расширения
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // Перенести пары ключ-значение из исходной хеш-таблицы в новую
    for (List<Pair> bucket in bucketsTmp) {
      for (Pair pair in bucket) {
        put(pair.key, pair.val);
      }
    }
  }

  /* Вывести хеш-таблицу */
  void printHashMap() {
    for (List<Pair> bucket in buckets) {
      List<String> res = [];
      for (Pair pair in bucket) {
        res.add("${pair.key} -> ${pair.val}");
      }
      print(res);
    }
  }
}

/* Driver Code */
void main() {
  /* Инициализация хеш-таблицы */
  HashMapChaining map = HashMapChaining();

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
  print("\nДля номера 13276 найдено имя ${name}");

  /* Операция удаления */
  // Удалить пару (key, value) из хеш-таблицы
  map.remove(12836);
  print("\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение");
  map.printHashMap();
}
