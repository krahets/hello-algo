/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
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

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    private size: number; // Число пар ключ-значение
    private capacity: number; // Вместимость хеш-таблицы
    private loadThres: number; // Порог коэффициента загрузки для запуска расширения
    private extendRatio: number; // Коэффициент расширения
    private buckets: Array<Pair | null>; // Массив корзин
    private TOMBSTONE: Pair; // Удалить метку

    /* Конструктор */
    constructor() {
        this.size = 0; // Число пар ключ-значение
        this.capacity = 4; // Вместимость хеш-таблицы
        this.loadThres = 2.0 / 3.0; // Порог коэффициента загрузки для запуска расширения
        this.extendRatio = 2; // Коэффициент расширения
        this.buckets = Array(this.capacity).fill(null); // Массив корзин
        this.TOMBSTONE = new Pair(-1, '-1'); // Удалить метку
    }

    /* Хеш-функция */
    private hashFunc(key: number): number {
        return key % this.capacity;
    }

    /* Коэффициент загрузки */
    private loadFactor(): number {
        return this.size / this.capacity;
    }

    /* Найти индекс корзины, соответствующий key */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // Выполнять линейное пробирование и завершить при встрече с пустой корзиной
        while (this.buckets[index] !== null) {
            // Если встретился key, вернуть соответствующий индекс корзины
            if (this.buckets[index]!.key === key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение на этот индекс
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Записать первую встретившуюся метку удаления
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины; при выходе за конец вернуться к началу
            index = (index + 1) % this.capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Операция поиска */
    get(key: number): string | null {
        // Найти индекс корзины, соответствующий key
        const index = this.findBucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // Если пары ключ-значение не существует, вернуть null
        return null;
    }

    /* Операция добавления */
    put(key: number, val: string): void {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // Найти индекс корзины, соответствующий key
        const index = this.findBucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // Если пары ключ-значение нет, добавить ее
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* Операция удаления */
    remove(key: number): void {
        // Найти индекс корзины, соответствующий key
        const index = this.findBucket(key);
        // Если пара ключ-значение найдена, заменить ее меткой удаления
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* Расширить хеш-таблицу */
    private extend(): void {
        // Временно сохранить исходную хеш-таблицу
        const bucketsTmp = this.buckets;
        // Инициализация новой хеш-таблицы после расширения
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    print(): void {
        for (const pair of this.buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* Driver Code */
// Инициализация хеш-таблицы
const hashmap = new HashMapOpenAddressing();

// Операция добавления
// Добавить пару (key, val) в хеш-таблицу
hashmap.put(12836, 'Сяо Ха');
hashmap.put(15937, 'Сяо Ло');
hashmap.put(16750, 'Сяо Суань');
hashmap.put(13276, 'Сяо Фа');
hashmap.put(10583, 'Сяо Я');
console.log('\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение');
hashmap.print();

// Операция поиска
// Передать ключ key в хеш-таблицу и получить значение val
const name = hashmap.get(13276);
console.log('\nПо номеру 13276 найдено имя ' + name);

// Операция удаления
// Удалить пару (key, val) из хеш-таблицы
hashmap.remove(16750);
console.log('\nПосле удаления 16750 хеш-таблица имеет вид\nКлюч -> Значение');
hashmap.print();

export {};
