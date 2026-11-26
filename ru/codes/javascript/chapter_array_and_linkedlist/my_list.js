/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Класс списка */
class MyList {
    #arr = new Array(); // Массив для хранения элементов списка
    #capacity = 10; // Ёмкость списка
    #size = 0; // Длина списка (текущее количество элементов)
    #extendRatio = 2; // Коэффициент увеличения ёмкости списка

    /* Конструктор */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* Получить длину списка (текущее количество элементов)*/
    size() {
        return this.#size;
    }

    /* Получить ёмкость списка */
    capacity() {
        return this.#capacity;
    }

    /* Доступ к элементу */
    get(index) {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
        return this.#arr[index];
    }

    /* Изменение элемента */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
        this.#arr[index] = num;
    }

    /* Добавление элемента в конец */
    add(num) {
        // Если длина равна ёмкости, увеличить ёмкость
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Добавить новый элемент в конец списка
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Вставка элемента в середину */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
        // Если для элементов не хватает места, увеличить ёмкость
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Обновить количество элементов
        this.#arr[index] = num;
        this.#size++;
    }

    /* Удаление элемента */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('Индекс за пределами списка');
        let num = this.#arr[index];
        // Сдвинуть все элементы после index на одну позицию влево
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Обновить количество элементов
        this.#size--;
        // Вернуть удалённый элемент
        return num;
    }

    /* Увеличение ёмкости списка */
    extendCapacity() {
        // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // Обновить ёмкость списка
        this.#capacity = this.#arr.length;
    }

    /* Преобразовать список в массив */
    toArray() {
        let size = this.size();
        // Преобразовать только используемую часть списка
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Демонстрационный код */
/* Инициализация списка */
const nums = new MyList();
/* Добавление элемента в конец */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `Список nums = ${nums.toArray()}, ёмкость = ${nums.capacity()}, длина = ${nums.size()}`
);

/* Вставка элемента в середину */
nums.insert(3, 6);
console.log(`После вставки числа 6 по индексу 3 nums = ${nums.toArray()}`);

/* Удаление элемента */
nums.remove(3);
console.log(`После удаления элемента по индексу 3 nums = ${nums.toArray()}`);

/* Доступ к элементу */
const num = nums.get(1);
console.log(`Элемент по индексу 1: num = ${num}`);

/* Изменение элемента */
nums.set(1, 0);
console.log(`После записи 0 по индексу 1 nums = ${nums.toArray()}`);

/* Проверка увеличения ёмкости */
for (let i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
    nums.add(i);
}
console.log(
    `После увеличения ёмкости список nums = ${nums.toArray()}, ёмкость = ${nums.capacity()}, длина = ${nums.size()}`
);
