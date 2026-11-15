/**
 * File: hash_map.dart
 * Created Time: 2023-03-29
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Driver Code */
void main() {
  // [region]{init_hash_map}
  /* Инициализация хеш-таблицы */
  final Map<int, String> map = {};
  // [endregion]{init_hash_map}

  // [region]{add_pairs}
  /* Операция добавления */
  // Добавить пару (key, value) в хеш-таблицу
  map[12836] = "Сяо Ха";
  map[15937] = "Сяо Ло";
  map[16750] = "Сяо Суань";
  map[13276] = "Сяо Фа";
  map[10583] = "Сяо Я";
  // [endregion]{add_pairs}
  print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение");
  map.forEach((key, value) => print("$key -> $value"));

  // [region]{get_value}
  /* Операция поиска */
  // Ввести в хеш-таблицу ключ key и получить значение value
  final String? name = map[15937];
  // [endregion]{get_value}
  print("\nДля номера 15937 найдено имя $name");

  // [region]{remove_pair}
  /* Операция удаления */
  // Удалить пару (key, value) из хеш-таблицы
  map.remove(10583);
  // [endregion]{remove_pair}
  print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение");
  map.forEach((key, value) => print("$key -> $value"));

  print("\nОтдельный обход пар ключ-значение");
  // [region]{iterate_pairs}
  /* Обход хеш-таблицы */
  // Обход пар ключ-значение key->value
  map.forEach((key, value) => print("$key -> $value"));
  // [endregion]{iterate_pairs}

  print("\nОтдельный обход ключей");
  // [region]{iterate_keys}
  // Обход только ключей key
  map.keys.forEach((key) => print(key));
  // [endregion]{iterate_keys}

  print("\nОтдельный обход значений");
  // [region]{iterate_values}
  // Обход только значений value
  map.values.forEach((value) => print(value));
  // [endregion]{iterate_values}
}
