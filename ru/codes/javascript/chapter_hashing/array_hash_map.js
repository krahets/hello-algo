/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Пара ключ-значение Number -> String */
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
        // Инициализировать массив, содержащий 100 корзин
        this.#buckets = new Array(100).fill(null);
    }

    /* Хеш-функция */
    #hashFunc(key) {
        return key % 100;
    }

    /* Операция поиска */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Операция добавления */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* Операция удаления */
    delete(key) {
        let index = this.#hashFunc(key);
        // Присвоить null, что означает удаление
        this.#buckets[index] = null;
    }

    /* Получить все пары ключ-значение */
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

/* Driver Code */
/* Инициализация хеш-таблицы */
const map = new ArrayHashMap();
/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Сяо Я');
console.info('\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение');
map.print();

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
let name = map.get(15937);
console.info('\nПо номеру 15937 найдено имя ' + name);

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.delete(10583);
console.info('\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение');
map.print();

/* Обход хеш-таблицы */
console.info('\nОтдельный обход пар ключ-значение');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nОтдельный обход ключей');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nОтдельный обход значений');
for (const val of map.values()) {
    console.info(val);
}
