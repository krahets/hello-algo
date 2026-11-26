/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Демонстрационный код */
/* Создать хеш-таблицу */
const map = new Map<number, string>();

/* Вставка */
// Добавить в таблицу пару (key, value)
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');
console.info('\nХеш-таблица после вставки:\nКлюч -> Значение');
console.info(map);

/* Поиск */
// Получить из таблицы значение value по ключу key
let name = map.get(15937);
console.info('\nИмя студента с номером 15937: ' + name);

/* Удаление */
// Удалить из таблицы пару (key, value)
map.delete(10583);
console.info('\nХеш-таблица после удаления 10583:\nКлюч -> Значение');
console.info(map);

/* Обход хеш-таблицы */
console.info('\nОбход пар «ключ -> значение»');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nОбход только ключей');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nОбход только значений');
for (const v of map.values()) {
    console.info(v);
}

export {};
