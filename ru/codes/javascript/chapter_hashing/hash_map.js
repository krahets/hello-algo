/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Driver Code */
/* Инициализация хеш-таблицы */
const map = new Map();

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');
console.info('\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение');
console.info(map);

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
let name = map.get(15937);
console.info('\nПо номеру 15937 найдено имя ' + name);

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.delete(10583);
console.info('\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение');
console.info(map);

/* Обход хеш-таблицы */
console.info('\nОтдельный обход пар ключ-значение');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nОтдельный обход ключей');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nОтдельный обход значений');
for (const v of map.values()) {
    console.info(v);
}
