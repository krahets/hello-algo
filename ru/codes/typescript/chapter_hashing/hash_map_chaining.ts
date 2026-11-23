/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Пара ключ-значение Number -> String */
class Pair {
    key: number;
    val: string;
    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица с цепочками */
class HashMapChaining {
    #size: number; // Число пар ключ-значение
    #capacity: number; // Вместимость хеш-таблицы
    #loadThres: number; // Порог коэффициента загрузки для запуска расширения
    #extendRatio: number; // Коэффициент расширения
    #buckets: Pair[][]; // Массив корзин

    /* Конструктор */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* Хеш-функция */
    #hashFunc(key: number): number {
        return key % this.#capacity;
    }

    /* Коэффициент загрузки */
    #loadFactor(): number {
        return this.#size / this.#capacity;
    }

    /* Операция поиска */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Обойти корзину; если найден key, вернуть соответствующее val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // Если key не найден, вернуть null
        return null;
    }

    /* Операция добавления */
    put(key: number, val: string): void {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // Обойти корзину; если встретился указанный key, обновить соответствующее val и вернуть
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
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // Обойти корзину и удалить из нее пару ключ-значение
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* Расширить хеш-таблицу */
    #extend(): void {
        // Временно сохранить исходную хеш-таблицу
        const bucketsTmp = this.#buckets;
        // Инициализация новой хеш-таблицы после расширения
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
    print(): void {
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
/* Инициализация хеш-таблицы */
const map = new HashMapChaining();

/* Операция добавления */
// Добавить пару (key, value) в хеш-таблицу
map.put(12836, 'Сяо Ха');
map.put(15937, 'Сяо Ло');
map.put(16750, 'Сяо Суань');
map.put(13276, 'Сяо Фа');
map.put(10583, 'Сяо Я');
console.log('\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение');
map.print();

/* Операция поиска */
// Ввести в хеш-таблицу ключ key и получить значение value
const name = map.get(13276);
console.log('\nПо номеру 13276 найдено имя ' + name);

/* Операция удаления */
// Удалить пару (key, value) из хеш-таблицы
map.remove(12836);
console.log('\nПосле удаления 12836 хеш-таблица имеет вид\nКлюч -> Значение');
map.print();

export {};
