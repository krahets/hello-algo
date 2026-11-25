/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Пара «ключ — значение» типа Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    #buckets;
    constructor() {
        // Создать массив из 100 корзин
        this.#buckets = new Array(100).fill(null);
    }

    /* Хеш-функция */
    #hashFunc(key) {
        return key % 100;
    }

    /* Поиск */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Вставка */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* Удаление */
    delete(key) {
        let index = this.#hashFunc(key);
        // Записать null в знак удаления
        this.#buckets[index] = null;
    }

    /* Получить все пары «ключ — значение» */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* Получить все ключи */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* Получить все значения */
    values() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].val);
            }
        }
        return arr;
    }

    /* Вывести хеш-таблицу */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* Демонстрационный код */
/* Создать хеш-таблицу */
const map = new ArrayHashMap();
/* Вставка */
// Добавить в таблицу пару (key, value)
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');
console.info('\nХеш-таблица после вставки:\nКлюч -> Значение');
map.print();

/* Поиск */
// Получить из таблицы значение value по ключу key
let name = map.get(15937);
console.info('\nИмя студента с номером 15937: ' + name);

/* Удаление */
// Удалить из таблицы пару (key, value)
map.delete(10583);
console.info('\nХеш-таблица после удаления 10583:\nКлюч -> Значение');
map.print();

/* Обход хеш-таблицы */
console.info('\nОбход пар «ключ -> значение»');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nОбход только ключей');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nОбход только значений');
for (const val of map.values()) {
    console.info(val);
}
