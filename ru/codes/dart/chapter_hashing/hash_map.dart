/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  /* Инициализация хеш-таблицы */
  final Map<int, String> map = {};

  /* Операция добавления */
  // Добавить пару (key, value) в хеш-таблицу
  map[12836] = "Сяо Ха";
  map[15937] = "Сяо Ло";
  map[16750] = "Сяо Суань";
  map[13276] = "Сяо Фа";
  map[10583] = "Сяо Я";
  print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
  map.forEach((key, value) => print("$key -> $value"));

  /* Операция поиска */
  // Ввести в хеш-таблицу ключ key и получить значение value
  final String? name = map[15937];
  print("\nДля номера 15937 найдено имя $name");

  /* Операция удаления */
  // Удалить пару (key, value) из хеш-таблицы
  map.remove(10583);
  print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
  map.forEach((key, value) => print("$key -> $value"));

  /* Обход хеш-таблицы */
  print("\nОтдельный обход пар ключ-значение");
  map.forEach((key, value) => print("$key -> $value"));
  print("\nОтдельный обход ключей");
  map.keys.forEach((key) => print(key));
  print("\nОтдельный обход значений");
  map.forEach((key, value) => print("$value"));
  map.values.forEach((value) => print(value));
}
