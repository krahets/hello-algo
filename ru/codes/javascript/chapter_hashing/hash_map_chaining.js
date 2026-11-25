/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Пара «ключ — значение» типа Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица с цепочками */
class HashMapChaining {
    #size; // Число пар «ключ — значение»
    #capacity; // Ёмкость хеш-таблицы
    #loadThres; // Порог коэффициента заполнения для расширения
    #extendRatio; // Во сколько раз увеличивается ёмкость
    #buckets; // Массив корзин

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

    /* Коэффициент заполнения */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Поиск */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Обойти корзину и при совпадении ключа key вернуть соответствующее значение val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // Если ключ key не найден, вернуть null
        return null;
    }

    /* Вставка */
    put(key, val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Обойти корзину. Если найден ключ key, обновить val и завершить операцию
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // Если ключа key нет, добавить пару в конец списка
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* Удаление */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Обойти корзину и удалить из неё нужную пару
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
        // Создать новую таблицу увеличенной ёмкости
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // Перенести пары из исходной таблицы в новую
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

/* Демонстрационный код */
/* Создать хеш-таблицу */
const map = new HashMapChaining();

/* Вставка */
// Добавить в таблицу пару (key, value)
map.put(12836, 'Сяо Ха');
map.put(15937, 'Сяо Ло');
map.put(16750, 'Сяо Суань');
map.put(13276, 'Сяо Фа');
map.put(10583, 'Сяо Я');
console.log('\nХеш-таблица после вставки:\nКлюч -> Значение');
map.print();

/* Поиск */
// Получить из таблицы значение value по ключу key
const name = map.get(13276);
console.log('\nИмя студента с номером 13276: ' + name);

/* Удаление */
// Удалить из таблицы пару (key, value)
map.remove(12836);
console.log('\nХеш-таблица после удаления 12836:\nКлюч -> Значение');
map.print();
