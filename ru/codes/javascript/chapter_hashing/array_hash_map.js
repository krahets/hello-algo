/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* пара ключ-значение Number -> String */
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
        // Инициализировать массив, содержащий 100 бакетов
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
        // Установить null, обозначая удаление
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
/* Инициализировать хеш-таблицу */
const map = new ArrayHashMap();
/* Операция добавления */
// Добавить в хеш-таблицу пару ключ-значение (key, value)
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Утенок');
console.info('\nПосле добавления хеш-таблица имеет вид\nKey -> Value');
map.print();

/* Операция поиска */
// Передать ключ key в хеш-таблицу и получить значение value
let name = map.get(15937);
console.info('\nВходномер 15937, найденоимя ' + name);

/* Операция удаления */
// Удалить из хеш-таблицы пару ключ-значение (key, value)
map.delete(10583);
console.info('\nПосле удаления 10583 хеш-таблица имеет вид\nKey -> Value');
map.print();

/* Перебрать хеш-таблицу */
console.info('\nОбойтипара ключ-значение Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nотдельноОбойтиключ Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nотдельноОбойтизначение Value');
for (const val of map.values()) {
    console.info(val);
}
