/**
 * File: array_hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Пара ключ-значение Number -> String */
class Pair {
    public key: number;
    public val: string;

    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица на основе массива */
class ArrayHashMap {
    private readonly buckets: (Pair | null)[];

    constructor() {
        // Инициализировать массив, содержащий 100 корзин
        this.buckets = new Array(100).fill(null);
    }

    /* Хеш-функция */
    private hashFunc(key: number): number {
        return key % 100;
    }

    /* Операция поиска */
    public get(key: number): string | null {
        let index = this.hashFunc(key);
        let pair = this.buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* Операция добавления */
    public set(key: number, val: string) {
        let index = this.hashFunc(key);
        this.buckets[index] = new Pair(key, val);
    }

    /* Операция удаления */
    public delete(key: number) {
        let index = this.hashFunc(key);
        // Присвоить null, что означает удаление
        this.buckets[index] = null;
    }

    /* Получить все пары ключ-значение */
    public entries(): (Pair | null)[] {
        let arr: (Pair | null)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i]);
            }
        }
        return arr;
    }

    /* Получить все ключи */
    public keys(): (number | undefined)[] {
        let arr: (number | undefined)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i].key);
            }
        }
        return arr;
    }

    /* Получить все значения */
    public values(): (string | undefined)[] {
        let arr: (string | undefined)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i].val);
            }
        }
        return arr;
    }

    /* Вывести хеш-таблицу */
    public print() {
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

export {};
