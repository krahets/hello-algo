/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Двусторонняя очередь на основе кольцевого массива */
class ArrayDeque {
    #nums; // Массив для хранения элементов двусторонней очереди
    #front; // Указатель head, указывающий на первый элемент очереди
    #queSize; // Длина двусторонней очереди

    /* Конструктор */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* Получить вместимость двусторонней очереди */
    capacity() {
        return this.#nums.length;
    }

    /* Получение длины двусторонней очереди */
    size() {
        return this.#queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    index(i) {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + this.capacity()) % this.capacity();
    }

    /* Добавление в голову очереди */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Двусторонняя очередь заполнена');
            return;
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        this.#front = this.index(this.#front - 1);
        // Добавить num в голову очереди
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* Добавление в хвост очереди */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Двусторонняя очередь заполнена');
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        const rear = this.index(this.#front + this.#queSize);
        // Добавить num в хвост очереди
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Извлечение из головы очереди */
    popFirst() {
        const num = this.peekFirst();
        // Указатель головы сдвигается на одну позицию назад
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* Извлечение из хвоста очереди */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* Доступ к элементу в конце очереди */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Вычислить индекс хвостового элемента
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* Вернуть массив для вывода */
    toArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* Инициализация двусторонней очереди */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('Двусторонняя очередь deque = [' + deque.toArray() + ']');

/* Доступ к элементу */
const peekFirst = deque.peekFirst();
console.log('Первый элемент peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('Последний элемент peekLast = ' + peekLast);

/* Добавление элемента в очередь */
deque.pushLast(4);
console.log('После добавления элемента 4 в хвост deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('После добавления элемента 1 в голову deque = [' + deque.toArray() + ']');

/* Извлечение элемента из очереди */
const popLast = deque.popLast();
console.log(
    'Извлеченный из хвоста элемент = ' +
        popLast +
        ', deque после извлечения из хвоста = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Извлеченный из головы элемент = ' +
        popFirst +
        ', deque после извлечения из головы = [' +
        deque.toArray() +
        ']'
);

/* Получение длины двусторонней очереди */
const size = deque.size();
console.log('Длина двусторонней очереди size = ' + size);

/* Проверка, пуста ли двусторонняя очередь */
const isEmpty = deque.isEmpty();
console.log('Пуста ли двусторонняя очередь = ' + isEmpty);
