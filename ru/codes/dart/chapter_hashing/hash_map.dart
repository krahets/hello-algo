/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  /* Инициализировать хеш-таблицу */
  final Map<int, String> map = {};

  /* Операция добавления */
  // Добавить в хеш-таблицу пару ключ-значение (key, value)
  map[12836] = "Сяо Ха";
  map[15937] = "Сяо Ло";
  map[16750] = "Сяо Суань";
  map[13276] = "Сяо Фа";
  map[10583] = "Утенок";
  print("\nПосле добавления хеш-таблица выглядит так\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Операция поиска */
  // Передать ключ key в хеш-таблицу и получить значение value
  final String? name = map[15937];
  print("\nПо номеру студента 15937 найдено имя $name");

  /* Операция удаления */
  // Удалить из хеш-таблицы пару ключ-значение (key, value)
  map.remove(10583);
  print("\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value");
  map.forEach((key, value) => print("$key -> $value"));

  /* Перебрать хеш-таблицу */
  print("\nПеребираем пары Key->Value");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nОтдельно перебираем ключи Key");
  map.keys.forEach((key) => print(key));
  print("\nОтдельно перебираем значения Value");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
