/**
 * File: hashMapOpenAddressing.js
 * Created Time: 2023-06-13
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
 */

/* Пара «ключ — значение» типа Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* Хеш-таблица с открытой адресацией */
class HashMapOpenAddressing {
    #size; // Число пар «ключ — значение»
    #capacity; // Ёмкость хеш-таблицы
    #loadThres; // Порог коэффициента заполнения для расширения
    #extendRatio; // Во сколько раз увеличивается ёмкость
    #buckets; // Массив корзин
    #TOMBSTONE; // Метка удаления

    /* Конструктор */
    constructor() {
        this.#size = 0; // Число пар «ключ — значение»
        this.#capacity = 4; // Ёмкость хеш-таблицы
        this.#loadThres = 2.0 / 3.0; // Порог коэффициента заполнения для расширения
        this.#extendRatio = 2; // Во сколько раз увеличивается ёмкость
        this.#buckets = Array(this.#capacity).fill(null); // Массив корзин
        this.#TOMBSTONE = new Pair(-1, '-1'); // Метка удаления
    }

    /* Хеш-функция */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* Коэффициент заполнения */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* Найти индекс корзины для ключа key */
    #findBucket(key) {
        let index = this.#hashFunc(key);
        let firstTombstone = -1;
        // Линейное пробирование до первой пустой корзины
        while (this.#buckets[index] !== null) {
            // При совпадении ключа key вернуть индекс его корзины
            if (this.#buckets[index].key === key) {
                // Если ранее встретилась метка удаления, переместить пару на её место
                if (firstTombstone !== -1) {
                    this.#buckets[firstTombstone] = this.#buckets[index];
                    this.#buckets[index] = this.#TOMBSTONE;
                    return firstTombstone; // Вернуть индекс корзины после перемещения
                }
                return index; // Вернуть индекс корзины
            }
            // Запомнить первую встретившуюся метку удаления
            if (
                firstTombstone === -1 &&
                this.#buckets[index] === this.#TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // Вычислить индекс корзины, после конца массива перейти в начало
            index = (index + 1) % this.#capacity;
        }
        // Если ключа key нет, вернуть индекс для вставки
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* Поиск */
    get(key) {
        // Найти индекс корзины для ключа key
        const index = this.#findBucket(key);
        // Если пара найдена, вернуть её значение val
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            return this.#buckets[index].val;
        }
        // Если пары нет, вернуть null
        return null;
    }

    /* Вставка */
    put(key, val) {
        // Расширить таблицу, если коэффициент заполнения превысил порог
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        // Найти индекс корзины для ключа key
        const index = this.#findBucket(key);
        // Если пара найдена, заменить val и завершить операцию
        if (
            this.#buckets[index] !== null &&
            this.#buckets[index] !== this.#TOMBSTONE
        ) {
            this.#buckets[index].val = val;
            return;
        }
        // Если пары нет, добавить её
        this.#buckets[index] = new Pair(key, val);
        this.#size++;
    }

    /* Удаление */
    remove(key) {
        // Найти индекс корзины для ключа key
        const index = this.#findBucket(key);
        // Если пара найдена, заменить её меткой удаления
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
        // Создать новую таблицу увеличенной ёмкости
        this.#capacity *= this.#extendRatio;
        this.#buckets = Array(this.#capacity).fill(null);
        this.#size = 0;
        // Перенести пары из исходной таблицы в новую
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

/* Демонстрационный код */
// Создать хеш-таблицу
const hashmap = new HashMapOpenAddressing();

// Вставка
// Добавить в таблицу пару (key, val)
hashmap.put(12836, 'Сяо Ха');
hashmap.put(15937, 'Сяо Ло');
hashmap.put(16750, 'Сяо Суань');
hashmap.put(13276, 'Сяо Фа');
hashmap.put(10583, 'Сяо Я');
console.log('\nХеш-таблица после вставки:\nКлюч -> Значение');
hashmap.print();

// Поиск
// Получить из таблицы значение val по ключу key
const name = hashmap.get(13276);
console.log('\nИмя студента с номером 13276: ' + name);

// Удаление
// Удалить из таблицы пару (key, val)
hashmap.remove(16750);
console.log('\nХеш-таблица после удаления 16750:\nКлюч -> Значение');
hashmap.print();
