/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Класс списка */
class MyList {
    #arr = new Array(); // Массив (хранит элементы списка)
    #capacity = 10; // Вместимость списка
    #size = 0; // Длина списка (текущее количество элементов)
    #extendRatio = 2; // Коэффициент расширения списка при каждом увеличении

    /* Конструктор */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* Получить длину списка (текущее количество элементов) */
    size() {
        return this.#size;
    }

    /* Получить вместимость списка */
    capacity() {
        return this.#capacity;
    }

    /* Получить доступ к элементу */
    get(index) {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if (index < 0 || index >= this.#size) throw new Error('индексвыходит за границы');
        return this.#arr[index];
    }

    /* Обновить элемент */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('индексвыходит за границы');
        this.#arr[index] = num;
    }

    /* Добавить элемент в конец */
    add(num) {
        // Если длина равна вместимости, требуется расширение
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Добавить новый элемент в конец списка
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Вставить элемент в середину */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('индексвыходит за границы');
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Обновить количество элементов
        this.#arr[index] = num;
        this.#size++;
    }

    /* Удалить элемент */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('индексвыходит за границы');
        let num = this.#arr[index];
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Обновить количество элементов
        this.#size--;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        this.#arr = this.#arr.concat(
            new Array(this.capacity() * (this.#extendRatio - 1))
        );
        // Обновить вместимость списка
        this.#capacity = this.#arr.length;
    }

    /* Преобразовать список в массив */
    toArray() {
        let size = this.size();
        // Преобразовать только элементы списка в пределах действительной длины
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Инициализировать список */
const nums = new MyList();
/* Добавить элемент в конец */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `список nums = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);

/* Вставить элемент в середину */
nums.insert(3, 6);
console.log(`После вставки числа 6 по индексу 3 получаем nums = ${nums.toArray()}`);

/* Удалить элемент */
nums.remove(3);
console.log(`После удаления элемента по индексу 3 получаем nums = ${nums.toArray()}`);

/* Получить доступ к элементу */
const num = nums.get(1);
console.log(`обратиться киндекс 1 поэлемент, получаем num = ${num}`);

/* Обновить элемент */
nums.set(1, 0);
console.log(`После обновления элемента по индексу 1 на 0 получаем nums = ${nums.toArray()}`);

/* Проверить механизм расширения */
for (let i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
    nums.add(i);
}
console.log(
    `Список nums после расширения = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);
