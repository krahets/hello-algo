/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* пара ключ-значение Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    #size; // Количество пар ключ-значение
    #capacity; // Вместимость хеш-таблицы
    #loadThres; // Порог коэффициента загрузки, запускающий расширение
    #extendRatio; // Коэффициент расширения
    #buckets; // Массив бакетов
    #TOMBSTONE; // Метка удаления

    /* Конструктор */
    constructor() {
        this.#size = 0; // Количество пар ключ-значение
        this.#capacity = 4; // Вместимость хеш-таблицы
        this.#loadThres = 2.0 / 3.0; // Порог коэффициента загрузки, запускающий расширение
        this.#extendRatio = 2; // Коэффициент расширения
        this.#buckets = Array(this.#capacity).fill(null); // Массив бакетов
        this.#TOMBSTONE = new Pair(-1, '-1'); // Метка удаления
    }

    /* Хеш-функция */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Коэффициент загрузки */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Найти индекс корзины, соответствующей ключу key */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // Выполнять линейное пробирование и остановиться при встрече с пустым бакетом
        while (this.#buckets[index] !== null) {
            // Если встретился key, вернуть соответствующий индекс бакета
            if (this.#buckets[index].key === key) {
                // Если ранее встретилась метка удаления, переместить пару ключ-значение в этот индекс
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // Вернуть индекс бакета после перемещения
                }
                return index; // Вернуть индекс бакета
            }
            // Записать первую встретившуюся метку удаления
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Вычислить индекс бакета; при выходе за конец вернуться к началу
            index = (index + 1) % this.#capacity;
        }
        // Если key не существует, вернуть индекс точки добавления
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Операция поиска */
    get(key) {
        // Найти индекс корзины, соответствующей ключу key
        const index = this.#findBucket(key);
        // Если пара ключ-значение найдена, вернуть соответствующее val
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // Если пара ключ-значение не существует, вернуть null
        return null;
    }

    /* Операция добавления */
    put(key, val) {
        // Когда коэффициент загрузки превышает порог, выполнить расширение
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // Найти индекс корзины, соответствующей ключу key
        const index = this.#findBucket(key);
        // Если пара ключ-значение найдена, перезаписать val и вернуть результат
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // Если пара ключ-значение не существует, добавить ее
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* Операция удаления */
    remove(key) {
        // Найти индекс корзины, соответствующей ключу key
        const index = this.#findBucket(key);
        // Если пара ключ-значение найдена, пометить ее меткой удаления
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index] = this.#TOMBSTONE;
            this.#size--;
        }
    }

    /* Расширить хеш-таблицу */
    #extend() {
        // Временно сохранить исходную хеш-таблицу
        const bucketsTmp = this.#buckets;
        // Инициализировать новую хеш-таблицу после расширения
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // Перенести пары ключ-значение из исходной хеш-таблицы в новую
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.#TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* Вывести хеш-таблицу */
    print() {
        for (const pair of this.#buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.#TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* Driver Code */
// Инициализировать хеш-таблицу
const hashmap = new HashMapOpenAddressing();

// Операция добавления
// Добавить пару ключ-значение (key, val) в хеш-таблицу
hashmap.put(12836, 'Сяо Ха');
hashmap.put(15937, 'Сяо Ло');
hashmap.put(16750, 'Сяо Суань');
hashmap.put(13276, 'Сяо Фа');
hashmap.put(10583, 'Утенок');
console.log('\nПосле добавления хеш-таблица выглядит так\nKey -> Value');
hashmap.print();

// Операция поиска
// Ввести ключ key в хеш-таблицу и получить значение val
const name = hashmap.get(13276);
console.log('\nПо номеру студента 13276 найдено имя ' + name);

// Операция удаления
// Удалить пару ключ-значение (key, val) из хеш-таблицы
hashmap.remove(16750);
console.log('\nПосле удаления 16750 хеш-таблица выглядит так\nKey -> Value');
hashmap.print();
