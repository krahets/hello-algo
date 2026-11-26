/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Двусторонняя очередь (дек) на основе кольцевого массива */
class ArrayDeque {
    #nums; // Массив для хранения элементов дека
    #front; // Индекс первого элемента дека
    #queSize; // Длина дека

    /* Конструктор */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* Получить ёмкость дека */
    capacity() {
        return this.#nums.length;
    }

    /* Получить длину дека */
    size() {
        return this.#queSize;
    }

    /* Проверить, пуст ли дек */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    index(i) {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        return (i + this.capacity()) % this.capacity();
    }

    /* Добавить элемент в начало дека */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Дек заполнен');
            return;
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        this.#front = this.index(this.#front - 1);
        // Добавить num в начало дека
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* Добавить элемент в конец дека */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Дек заполнен');
            return;
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        const rear = this.index(this.#front + this.#queSize);
        // Добавить num в конец дека
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Извлечь элемент из начала дека */
    popFirst() {
        const num = this.peekFirst();
        // Сдвинуть индекс начала дека на одну позицию вперёд
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* Извлечь элемент из конца дека */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* Посмотреть первый элемент дека */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* Посмотреть последний элемент дека */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Вычислить индекс последнего элемента
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* Вернуть массив для вывода */
    toArray() {
        // Преобразовать только те элементы, которые сейчас находятся в деке
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Пример использования */
/* Инициализировать дек */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('Дек deque = [' + deque.toArray() + ']');

/* Посмотреть первый и последний элементы */
const peekFirst = deque.peekFirst();
console.log('Первый элемент дека peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('Последний элемент дека peekLast = ' + peekLast);

/* Добавить элементы в дек */
deque.pushLast(4);
console.log('После добавления 4 в конец дека deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('После добавления 1 в начало дека deque = [' + deque.toArray() + ']');

/* Извлечь элементы из дека */
const popLast = deque.popLast();
console.log(
    'Извлечённый последний элемент = ' +
        popLast +
        ', после извлечения из конца deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Извлечённый первый элемент = ' +
        popFirst +
        ', после извлечения из начала deque = [' +
        deque.toArray() +
        ']'
);

/* Получить длину дека */
const size = deque.size();
console.log('Длина дека size = ' + size);

/* Проверить, пуст ли дек */
const isEmpty = deque.isEmpty();
console.log('Дек пуст = ' + isEmpty);
