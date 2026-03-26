/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Очередь на основе циклического массива */
class ArrayQueue {
    #nums; // Массив для хранения элементов очереди
    #front = 0; // Указатель front, указывающий на первый элемент очереди
    #queSize = 0; // Длина очереди

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* Получить вместимость очереди */
    get capacity() {
        return this.#nums.length;
    }

    /* Получить длину очереди */
    get size() {
        return this.#queSize;
    }

    /* Проверить, пуста ли очередь */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Поместить в очередь */
    push(num) {
        if (this.size === this.capacity) {
            console.log('очередьзаполнен');
            return;
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        const rear = (this.#front + this.size) % this.capacity;
        // Добавить num в конец очереди
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Извлечь из очереди */
    pop() {
        const num = this.peek();
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    peek() {
        if (this.isEmpty()) throw new Error('очередьпуст');
        return this.#nums[this.#front];
    }

    /* Вернуть Array */
    toArray() {
        // Преобразовать только элементы списка в пределах действительной длины
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* Инициализировать очередь */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* Поместить элемент в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('очередь queue =', queue.toArray());

/* Получить элемент в начале очереди */
const peek = queue.peek();
console.log('элемент в голове очереди peek =' + peek);

/* Извлечь элемент из очереди */
const pop = queue.pop();
console.log('Элемент, извлеченный из очереди, pop =' + pop + ', queue после извлечения =', queue.toArray());

/* Получить длину очереди */
const size = queue.size;
console.log('Длина очереди size =' + size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.isEmpty();
console.log('Очередь пуста:' + isEmpty);

/* Проверить кольцевой массив */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('Итерация' + i + 'после enqueue + dequeue queue =', queue.toArray());
}
