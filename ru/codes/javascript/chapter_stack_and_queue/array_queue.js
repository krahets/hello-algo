/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    #nums; // Массив для хранения элементов очереди
    #front = 0; // Индекс первого элемента очереди
    #queSize = 0; // Длина очереди

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* Получить ёмкость очереди */
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

    /* Добавить элемент в очередь */
    push(num) {
        if (this.size === this.capacity) {
            console.log('Очередь заполнена');
            return;
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        const rear = (this.#front + this.size) % this.capacity;
        // Добавить num в конец очереди
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Извлечь элемент из очереди */
    pop() {
        const num = this.peek();
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    peek() {
        if (this.isEmpty()) throw new Error('Очередь пуста');
        return this.#nums[this.#front];
    }

    /* Вернуть массив */
    toArray() {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Пример использования */
/* Инициализировать очередь */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* Добавить элементы в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue =', queue.toArray());

/* Посмотреть первый элемент очереди */
const peek = queue.peek();
console.log('Первый элемент очереди peek = ' + peek);

/* Извлечь элемент из очереди */
const pop = queue.pop();
console.log('Извлечённый элемент pop = ' + pop + ', после извлечения queue =', queue.toArray());

/* Получить длину очереди */
const size = queue.size;
console.log('Длина очереди size = ' + size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.isEmpty();
console.log('Очередь пуста = ' + isEmpty);

/* Проверить работу кольцевого массива */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('В цикле ' + i + ' после добавления и извлечения элемента queue =', queue.toArray());
}
