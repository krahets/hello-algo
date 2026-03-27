/**
 * File: array_hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* пара ключ-значение Number -> String */
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
        // Инициализировать массив, содержащий 100 бакетов
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
        // Установить null, обозначая удаление
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
/* Инициализировать хеш-таблицу */
const map = new ArrayHashMap();
/* Операция добавления */
// Добавить в хеш-таблицу пару ключ-значение (key, value)
map.set(12836, 'Сяо Ха');
map.set(15937, 'Сяо Ло');
map.set(16750, 'Сяо Суань');
map.set(13276, 'Сяо Фа');
map.set(10583, 'Утенок');
console.info('\nПосле добавления хеш-таблица выглядит так\nKey -> Value');
map.print();

/* Операция поиска */
// Передать ключ key в хеш-таблицу и получить значение value
let name = map.get(15937);
console.info('\nПо номеру студента 15937 найдено имя ' + name);

/* Операция удаления */
// Удалить из хеш-таблицы пару ключ-значение (key, value)
map.delete(10583);
console.info('\nПосле удаления 10583 хеш-таблица выглядит так\nKey -> Value');
map.print();

/* Перебрать хеш-таблицу */
console.info('\nПеребираем пары Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\nОтдельно перебираем ключи Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\nОтдельно перебираем значения Value');
for (const val of map.values()) {
    console.info(val);
}

export {};
