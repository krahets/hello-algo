/**
 * File: my_list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Класс списка */
class MyList {
    #arr = new Array(); // Массив (для хранения элементов списка)
    #capacity = 10; // Вместимость списка
    #size = 0; // Длина списка (текущее число элементов)
    #extendRatio = 2; // Коэффициент увеличения списка при каждом расширении

    /* Конструктор */
    constructor() {
        this.#arr = new Array(this.#capacity);
    }

    /* Получить длину списка (текущее число элементов) */
    size() {
        return this.#size;
    }

    /* Получить вместимость списка */
    capacity() {
        return this.#capacity;
    }

    /* Доступ к элементу */
    get(index) {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
        return this.#arr[index];
    }

    /* Обновление элемента */
    set(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
        this.#arr[index] = num;
    }

    /* Добавление элемента в конец */
    add(num) {
        // Если длина равна вместимости, требуется расширение
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Добавить новый элемент в конец списка
        this.#arr[this.#size] = num;
        this.#size++;
    }

    /* Вставка элемента в середину */
    insert(index, num) {
        if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
        // При превышении вместимости по числу элементов запускается расширение
        if (this.#size === this.#capacity) {
            this.extendCapacity();
        }
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (let j = this.#size - 1; j >= index; j--) {
            this.#arr[j + 1] = this.#arr[j];
        }
        // Обновить число элементов
        this.#arr[index] = num;
        this.#size++;
    }

    /* Удаление элемента */
    remove(index) {
        if (index < 0 || index >= this.#size) throw new Error('индекс выходит за границы');
        let num = this.#arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (let j = index; j < this.#size - 1; j++) {
            this.#arr[j] = this.#arr[j + 1];
        }
        // Обновить число элементов
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
        // Преобразовывать только элементы списка в пределах фактической длины
        const arr = new Array(size);
        for (let i = 0; i < size; i++) {
            arr[i] = this.get(i);
        }
        return arr;
    }
}

/* Driver Code */
/* Инициализация списка */
const nums = new MyList();
/* Добавление элемента в конец */
nums.add(1);
nums.add(3);
nums.add(2);
nums.add(5);
nums.add(4);
console.log(
    `Список nums = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
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

/* Обновление элемента */
nums.set(1, 0);
console.log(`После обновления элемента по индексу 1 до 0 nums = ${nums.toArray()}`);

/* Проверка механизма расширения */
for (let i = 0; i < 10; i++) {
    // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
    nums.add(i);
}
console.log(
    `Список nums после увеличения вместимости = ${nums.toArray()}, вместимость = ${nums.capacity()}, длина = ${nums.size()}`
);
