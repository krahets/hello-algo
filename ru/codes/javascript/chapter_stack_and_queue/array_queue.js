/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    #nums; // Массив для хранения элементов очереди
    #front = 0; // Указатель head, указывающий на первый элемент очереди
    #queSize = 0; // Длина очереди

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* Получить вместимость очереди */
    get capacity() {
        return this.#nums.length;
    }

    /* Получение длины очереди */
    get size() {
        return this.#queSize;
    }

    /* Проверка, пуста ли очередь */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Поместить в очередь */
    push(num) {
        if (this.size === this.capacity) {
            console.log('Очередь заполнена');
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        const rear = (this.#front + this.size) % this.capacity;
        // Добавить num в хвост очереди
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Извлечь из очереди */
    pop() {
        const num = this.peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    peek() {
        if (this.isEmpty()) throw new Error('очередь пуста');
        return this.#nums[this.#front];
    }

    /* Вернуть Array */
    toArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* Инициализация очереди */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue =', queue.toArray());

/* Доступ к элементу в начале очереди */
const peek = queue.peek();
console.log('Первый элемент peek = ' + peek);

/* Извлечение элемента из очереди */
const pop = queue.pop();
console.log('Извлеченный элемент pop = ' + pop + ', queue после извлечения =', queue.toArray());

/* Получение длины очереди */
const size = queue.size;
console.log('Длина очереди size = ' + size);

/* Проверка, пуста ли очередь */
const isEmpty = queue.isEmpty();
console.log('Пуста ли очередь = ' + isEmpty);

/* Проверка кольцевого массива */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('После ' + i + '-го раунда операций enqueue и dequeue queue =', queue.toArray());
}
