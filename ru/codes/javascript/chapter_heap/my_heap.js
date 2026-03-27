/**
 * File: my_heap.js
 * Created Time: 2023-02-06
 * Author: what-is-me (whatisme@outlook.jp)
 */

const { printHeap } = require('../modules/PrintUtil');

/* Класс максимальной кучи */
class MaxHeap {
    #maxHeap;

    /* Конструктор, создающий пустую кучу или строящий кучу по входному списку */
    constructor(nums) {
        // Добавить элементы списка в кучу без изменений
        this.#maxHeap = nums === undefined ? [] : [...nums];
        // Выполнить heapify для всех узлов, кроме листовых
        for (let i = this.#parent(this.size() - 1); i >= 0; i--) {
            this.#siftDown(i);
        }
    }

    /* Получить индекс левого дочернего узла */
    #left(i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла */
    #right(i) {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла */
    #parent(i) {
        return Math.floor((i - 1) / 2); // Округление вниз при делении
    }

    /* Поменять элементы местами */
    #swap(i, j) {
        const tmp = this.#maxHeap[i];
        this.#maxHeap[i] = this.#maxHeap[j];
        this.#maxHeap[j] = tmp;
    }

    /* Получение размера кучи */
    size() {
        return this.#maxHeap.length;
    }

    /* Проверка, пуста ли куча */
    isEmpty() {
        return this.size() === 0;
    }

    /* Доступ к элементу на вершине кучи */
    peek() {
        return this.#maxHeap[0];
    }

    /* Добавление элемента в кучу */
    push(val) {
        // Добавление узла
        this.#maxHeap.push(val);
        // Просеивание снизу вверх
        this.#siftUp(this.size() - 1);
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    #siftUp(i) {
        while (true) {
            // Получение родительского узла для узла i
            const p = this.#parent(i);
            // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
            if (p < 0 || this.#maxHeap[i] <= this.#maxHeap[p]) break;
            // Поменять два узла местами
            this.#swap(i, p);
            // Циклическое просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    pop() {
        // Обработка пустого случая
        if (this.isEmpty()) throw new Error('куча пуста');
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        this.#swap(0, this.size() - 1);
        // Удаление узла
        const val = this.#maxHeap.pop();
        // Просеивание сверху вниз
        this.#siftDown(0);
        // Вернуть элемент с вершины кучи
        return val;
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    #siftDown(i) {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            const l = this.#left(i),
                r = this.#right(i);
            let ma = i;
            if (l < this.size() && this.#maxHeap[l] > this.#maxHeap[ma]) ma = l;
            if (r < this.size() && this.#maxHeap[r] > this.#maxHeap[ma]) ma = r;
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if (ma === i) break;
            // Поменять два узла местами
            this.#swap(i, ma);
            // Циклическое просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу (двоичное дерево) */
    print() {
        printHeap(this.#maxHeap);
    }

    /* Извлечь элементы из кучи */
    getMaxHeap() {
        return this.#maxHeap;
    }
}

/* Driver Code */
if (require.main === module) {
    /* Инициализация максимальной кучи */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nПосле построения кучи из входного списка');
    maxHeap.print();

    /* Получение элемента с вершины кучи */
    let peek = maxHeap.peek();
    console.log(`\nЭлемент на вершине кучи = ${peek}`);

    /* Добавление элемента в кучу */
    let val = 7;
    maxHeap.push(val);
    console.log(`\nПосле добавления элемента ${val} в кучу`);
    maxHeap.print();

    /* Извлечение элемента с вершины кучи */
    peek = maxHeap.pop();
    console.log(`\nПосле извлечения элемента вершины кучи ${peek}`);
    maxHeap.print();

    /* Получение размера кучи */
    let size = maxHeap.size();
    console.log(`\nКоличество элементов в куче = ${size}`);

    /* Проверка, пуста ли куча */
    let isEmpty = maxHeap.isEmpty();
    console.log(`\nПуста ли куча: ${isEmpty}`);
}

module.exports = {
    MaxHeap,
};
