/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Демонстрационный код */
void main() {
  /* Создать хеш-таблицу */
  final Map<int, String> map = {};

  /* Вставка */
  // Добавить в таблицу пару (key, value)
  map[12836] = "Сяо Ха";
  map[15937] = "Сяо Ло";
  map[16750] = "Сяо Суань";
  map[13276] = "Сяо Фа";
  map[10583] = "Сяо Я";
  print("\nХеш-таблица после вставки:\nКлюч -> Значение");
  map.forEach((key, value) => print("$key -> $value"));

  /* Поиск */
  // Получить из таблицы значение value по ключу key
  final String? name = map[15937];
  print("\nИмя студента с номером 15937: $name");

  /* Удаление */
  // Удалить из таблицы пару (key, value)
  map.remove(10583);
  print("\nХеш-таблица после удаления 10583:\nКлюч -> Значение");
  map.forEach((key, value) => print("$key -> $value"));

  /* Обход хеш-таблицы */
  print("\nОбход пар «ключ -> значение»");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nОбход только ключей");
  map.keys.forEach((key) => print(key));
  print("\nОбход только значений");
  map.values.forEach((value) => print(value));
}
