/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Двусторонняя очередь на основе циклического массива */
class ArrayDeque {
    #nums; // Массив для хранения элементов двусторонней очереди
    #front; // Указатель front, указывающий на первый элемент очереди
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

    /* Получить длину двусторонней очереди */
    size() {
        return this.#queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Вычислить индекс циклического массива */
    index(i) {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        return (i + this.capacity()) % this.capacity();
    }

    /* Поместить в голову очереди */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('двусторонняя очередьзаполнен');
            return;
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        this.#front = this.index(this.#front - 1);
        // Добавить num в голову очереди
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* Поместить в хвост очереди */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('двусторонняя очередьзаполнен');
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        const rear = this.index(this.#front + this.#queSize);
        // Добавить num в конец очереди
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Извлечь из головы очереди */
    popFirst() {
        const num = this.peekFirst();
        // Указатель головы очереди сдвигается на одну позицию вперед
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* Извлечь из хвоста очереди */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* Обратиться к элементу в хвосте очереди */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Вычислить индекс хвостового элемента
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* Вернуть массив для печати */
    toArray() {
        // Преобразовать только элементы списка в пределах действительной длины
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* Инициализировать двустороннюю очередь */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('двусторонняя очередь deque = [' + deque.toArray() + ']');

/* Получить доступ к элементу */
const peekFirst = deque.peekFirst();
console.log('элемент в голове очереди peekFirst =' + peekFirst);
const peekLast = deque.peekLast();
console.log('элемент в хвосте очереди peekLast =' + peekLast);

/* Поместить элемент в очередь */
deque.pushLast(4);
console.log('После помещения элемента 4 в хвост очереди deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('После помещения элемента 1 в голову очереди deque = [' + deque.toArray() + ']');

/* Извлечь элемент из очереди */
const popLast = deque.popLast();
console.log(
    'Элемент, извлеченный из хвоста очереди, = ' +
        popLast +
        ', deque после извлечения из хвоста = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Элемент, извлеченный из головы очереди, = ' +
        popFirst +
        ', deque после извлечения из головы = [' +
        deque.toArray() +
        ']'
);

/* Получить длину двусторонней очереди */
const size = deque.size();
console.log('Длина двусторонней очереди size =' + size);

/* Проверить, пуста ли двусторонняя очередь */
const isEmpty = deque.isEmpty();
console.log('двусторонняя Очередь пуста:' + isEmpty);
