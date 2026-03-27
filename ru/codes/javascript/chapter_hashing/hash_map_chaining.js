/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* пара ключ-значение Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица с цепочечной адресацией */
class HashMapChaining {
    #size; // Количество пар ключ-значение
    #capacity; // Вместимость хеш-таблицы
    #loadThres; // Порог коэффициента загрузки, запускающий расширение
    #extendRatio; // Коэффициент расширения
    #buckets; // Массив бакетов

    /* Конструктор */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* Хеш-функция */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Коэффициент загрузки */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Операция поиска */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Обойти бакет; если найден key, вернуть соответствующее val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // Если key не найден, вернуть null
        return null;
    }

    /* Операция добавления */
    put(key, val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Обойти бакет; если встретился указанный key, обновить соответствующее val и вернуть результат
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // Если такого key нет, добавить пару ключ-значение в конец
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Операция удаления */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Обойти бакет и удалить из него пару ключ-значение
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Расширить хеш-таблицу */
    #extend() {
        // Временно сохранить исходную хеш-таблицу
        const bucketsTmp = this.#buckets;
        // Инициализировать новую хеш-таблицу после расширения
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    print() {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* Driver Code */
/* Инициализировать хеш-таблицу */
const map = new HashMapChaining();

/* Операция добавления */
// Добавить в хеш-таблицу пару ключ-значение (key, value)
map.put(12836, 'Сяо Ха');
map.put(15937, 'Сяо Ло');
map.put(16750, 'Сяо Суань');
map.put(13276, 'Сяо Фа');
map.put(10583, 'Утенок');
console.log('\nПосле добавления хеш-таблица выглядит так\nKey -> Value');
map.print();

/* Операция поиска */
// Передать ключ key в хеш-таблицу и получить значение value
const name = map.get(13276);
console.log('\nПо номеру студента 13276 найдено имя ' + name);

/* Операция удаления */
// Удалить из хеш-таблицы пару ключ-значение (key, value)
map.remove(12836);
console.log('\nПосле удаления 12836 хеш-таблица выглядит так\nKey -> Value');
map.print();
