/**
 * File: hash_map_chaining.dart
 * Created Time: 2023-06-24
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'array_hash_map.dart';

/* Хеш-таблица с цепочками */
class HashMapChaining {
  late int size; // Число пар «ключ — значение»
  late int capacity; // Ёмкость хеш-таблицы
  late double loadThres; // Порог коэффициента заполнения для расширения
  late int extendRatio; // Во сколько раз увеличивается ёмкость
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

  /* Коэффициент заполнения */
  double loadFactor() {
    return size / capacity;
  }

  /* Поиск */
  String? get(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
    for (Pair pair in bucket) {
      if (pair.key == key) {
        return pair.val;
      }
    }
    // Если ключ key не найден, вернуть null
    return null;
  }

  /* Вставка */
  void put(int key, String val) {
    // Расширить таблицу, если коэффициент заполнения превысил порог
    if (loadFactor() > loadThres) {
      extend();
    }
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
    for (Pair pair in bucket) {
      if (pair.key == key) {
        pair.val = val;
        return;
      }
    }
    // Если ключа key нет, добавить пару в конец списка
    Pair pair = Pair(key, val);
    bucket.add(pair);
    size++;
  }

  /* Удаление */
  void remove(int key) {
    int index = hashFunc(key);
    List<Pair> bucket = buckets[index];
    // Обойти корзину и удалить из неё нужную пару
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
    // Создать новую таблицу увеличенной ёмкости
    capacity *= extendRatio;
    buckets = List.generate(capacity, (_) => []);
    size = 0;
    // Перенести пары из исходной таблицы в новую
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

/* Демонстрационный код */
void main() {
  /* Создать хеш-таблицу */
  HashMapChaining map = HashMapChaining();

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
  print("\nИмя студента с номером 13276: ${name}");

  /* Удаление */
  // Удалить из таблицы пару (key, value)
  map.remove(12836);
  print("\nХеш-таблица после удаления 12836:\nКлюч -> Значение");
  map.printHashMap();
}
