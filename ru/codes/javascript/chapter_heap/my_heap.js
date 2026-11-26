/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* Класс макс-кучи */
class MaxHeap {
    #maxHeap;

    /* Конструктор пустой кучи или кучи по входному списку */
    constructor(nums) {
        // Поместить элементы списка в кучу в прежнем порядке
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Выполнить просеивание для всех узлов, кроме листьев
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* Индекс левого ребёнка */
    #left(i) {
        return 2 * i + 1;
    }

    /* Индекс правого ребёнка */
    #right(i) {
        return 2 * i + 2;
    }

    /* Индекс родителя */
    #parent(i) {
        return Math.floor((i - 1) / 2); // Целочисленное деление с округлением вниз
    }

    /* Поменять элементы местами */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* Размер кучи */
    size() {
        return this.#maxHeap.length;
    }

    /* Проверить, пуста ли куча */
    isEmpty() {
        return this.size() === 0;
    }

    /* Посмотреть элемент в корне */
    peek() {
        return this.#maxHeap[0];
    }

    /* Вставить элемент в кучу */
    push(val) {
        // Добавить узел
        this.#maxHeap.push(val);
        // Просеивание вверх
        this.#siftUp(this.size() - 1);
    }

    /* Просеивать вверх от узла i */
    #siftUp(i) {
        while (true) {
            // Найти родителя узла i
            const p = this.#parent(i);
            // Если вышли за корень или узел уже на своём месте, завершить просеивание
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // Поменять два узла местами
            this.#swap(i, p);
            // Продолжить просеивание вверх
            i = p;
        }
    }

    /* Извлечь элемент из кучи */
    pop() {
        // Проверить, пуста ли куча
        if (this.isEmpty()) throw new Error('Куча пуста');
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        this.#swap(0, this.size() - 1);
        // Удалить узел
        const val = this.#maxHeap.pop();
        // Просеивание вниз
        this.#siftDown(0);
        // Вернуть элемент из корня
        return val;
    }

    /* Просеивать вниз от узла i */
    #siftDown(i) {
        while (true) {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // Если ни у одного потомка значение не больше, чем у родителя, завершить просеивание
            if (ma === i) break;
            // Поменять два узла местами
            this.#swap(i, ma);
            // Продолжить просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу в виде бинарного дерева */
    print() {
        printHeap(this.#maxHeap);
    }

    /* Извлечь элементы кучи */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Пример использования */
if (require.main === module) {
    /* Инициализировать макс-кучу */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nКуча, построенная по входному списку:');
    maxHeap.print();

    /* Получить элемент в корне */
    let peek = maxHeap.peek();
    console.log(`\nЭлемент в корне: ${peek}`);

    /* Вставить элемент в кучу */
    let val = 7;
    maxHeap.push(val);
    console.log(`\nПосле вставки элемента ${val}:`);
    maxHeap.print();

    /* Извлечь элемент из корня */
    peek = maxHeap.pop();
    console.log(`\nПосле извлечения элемента ${peek} из корня:`);
    maxHeap.print();

    /* Размер кучи */
    let size = maxHeap.size();
    console.log(`\nЧисло элементов в куче: ${size}`);

    /* Проверить, пуста ли куча */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\nПуста ли куча: ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
