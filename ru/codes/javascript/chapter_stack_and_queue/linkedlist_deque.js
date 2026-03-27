/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    prev; // Ссылка на узел-предшественник (указатель)
    next; // Ссылка на узел-преемник (указатель)
    val; // Значение узла

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
    #front; // Головной узел front
    #rear; // Хвостовой узел rear
    #queSize; // Длина двусторонней очереди

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* Операция добавления в хвост очереди */
    pushLast(val) {
        const node = new ListNode(val);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Добавить node в хвост списка
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // Обновить хвостовой узел
        }
        this.#queSize++;
    }

    /* Операция добавления в голову очереди */
    pushFirst(val) {
        const node = new ListNode(val);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Добавить node в голову списка
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // Обновить головной узел
        }
        this.#queSize++;
    }

    /* Операция извлечения из хвоста очереди */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // Сохранить значение хвостового узла
        // Удалить хвостовой узел
        let temp = this.#rear.prev;
        if (temp !== null) {
            temp.next = null;
            this.#rear.prev = null;
        }
        this.#rear = temp; // Обновить хвостовой узел
        this.#queSize--;
        return value;
    }

    /* Операция извлечения из головы очереди */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // Сохранить значение хвостового узла
        // Удалить головной узел
        let temp = this.#front.next;
        if (temp !== null) {
            temp.prev = null;
            this.#front.next = null;
        }
        this.#front = temp; // Обновить головной узел
        this.#queSize--;
        return value;
    }

    /* Доступ к элементу в конце очереди */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* Доступ к элементу в начале очереди */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* Получение длины двусторонней очереди */
    size() {
        return this.#queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Вывести двустороннюю очередь */
    print() {
        const arr = [];
        let temp = this.#front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* Driver Code */
/* Инициализация двусторонней очереди */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Двусторонняя очередь linkedListDeque = ');
linkedListDeque.print();

/* Доступ к элементу */
const peekFirst = linkedListDeque.peekFirst();
console.log('Первый элемент peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('Последний элемент peekLast = ' + peekLast);

/* Добавление элемента в очередь */
linkedListDeque.pushLast(4);
console.log('После добавления элемента 4 в хвост linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('После добавления элемента 1 в голову linkedListDeque = ');
linkedListDeque.print();

/* Извлечение элемента из очереди */
const popLast = linkedListDeque.popLast();
console.log('Извлеченный из хвоста элемент = ' + popLast + ', linkedListDeque после извлечения из хвоста = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('Извлеченный из головы элемент = ' + popFirst + ', linkedListDeque после извлечения из головы = ');
linkedListDeque.print();

/* Получение длины двусторонней очереди */
const size = linkedListDeque.size();
console.log('Длина двусторонней очереди size = ' + size);

/* Проверка, пуста ли двусторонняя очередь */
const isEmpty = linkedListDeque.isEmpty();
console.log('Пуста ли двусторонняя очередь = ' + isEmpty);
