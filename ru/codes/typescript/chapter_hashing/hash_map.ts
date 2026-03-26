/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Driver Code */
/* Инициализировать хеш-таблицу */
const map = new Map<number, string>();

/* Операция добавления */
// Добавить в хеш-таблицу пару ключ-значение (key, value)
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Утенок');
console.info('\nПосле добавления хеш-таблица имеет вид\nKey -> Value');
console.info(map);

/* Операция поиска */
// Передать ключ key в хеш-таблицу и получить значение value
let name = map.get(15937);
console.info('\nВходномер 15937, найденоимя ' + name);

/* Операция удаления */
// Удалить из хеш-таблицы пару ключ-значение (key, value)
map.delete(10583);
console.info('\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value');
console.info(map);

/* Перебрать хеш-таблицу */
console.info('\nОбойтипара ключ-значение Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nотдельноОбойтиключ Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nотдельноОбойтизначение Value');
for (const v of map.values()) {
    console.info(v);
}

export {};
