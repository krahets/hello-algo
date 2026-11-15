/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Driver Code */
// [region]{init_hash_map}
/* Инициализация хеш-таблицы */
const map = new Map<number, string>();
// [endregion]{init_hash_map}

// [region]{add_pairs}
/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');
// [endregion]{add_pairs}
console.info('\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение');
console.info(map);

// [region]{get_value}
/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
let name = map.get(15937);
// [endregion]{get_value}
console.info('\nПо номеру 15937 найдено имя ' + name);

// [region]{remove_pair}
/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.delete(10583);
// [endregion]{remove_pair}
console.info('\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение');
console.info(map);

console.info('\nОтдельный обход пар ключ-значение');
// [region]{iterate_pairs}
/* Обход хеш-таблицы */
// Обход пар ключ-значение key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
// [endregion]{iterate_pairs}

console.info('\nОтдельный обход ключей');
// [region]{iterate_keys}
// Обход только ключей key
for (const k of map.keys()) {
    console.info(k);
}
// [endregion]{iterate_keys}

console.info('\nОтдельный обход значений');
// [region]{iterate_values}
// Обход только значений value
for (const v of map.values()) {
    console.info(v);
}
// [endregion]{iterate_values}

export {};
