/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    prev; // Ссылка (указатель) на предыдущий узел
    next; // Ссылка (указатель) на следующий узел
    val; // Значение узла

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
    #front; // Первый узел front
    #rear; // Последний узел rear
    #queSize; // Длина дека

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* Добавить элемент в конец дека */
    pushLast(val) {
        const node = new ListNode(val);
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Добавить node в конец связного списка
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // Обновить ссылку на последний узел
        }
        this.#queSize++;
    }

    /* Добавить элемент в начало дека */
    pushFirst(val) {
        const node = new ListNode(val);
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Добавить node в начало связного списка
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // Обновить ссылку на первый узел
        }
        this.#queSize++;
    }

    /* Извлечь элемент из конца дека */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // Сохранить значение последнего узла
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // Удалить последний узел
        else {
            let temp = this.#rear.prev;
            temp.next = null;
            this.#rear.prev = null;
            this.#rear = temp; // Обновить ссылку на последний узел
        }
        this.#queSize--;
        return value;
    }

    /* Извлечь элемент из начала дека */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // Сохранить значение первого узла
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // Удалить первый узел
        else {
            let temp = this.#front.next;
            temp.prev = null;
            this.#front.next = null;
            this.#front = temp; // Обновить ссылку на первый узел
        }
        this.#queSize--;
        return value;
    }

    /* Посмотреть последний элемент дека */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* Посмотреть первый элемент дека */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* Получить длину дека */
    size() {
        return this.#queSize;
    }

    /* Проверить, пуст ли дек */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Вывести дек */
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

/* Пример использования */
/* Инициализировать дек */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Дек linkedListDeque = ');
linkedListDeque.print();

/* Посмотреть первый и последний элементы */
const peekFirst = linkedListDeque.peekFirst();
console.log('Первый элемент дека peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('Последний элемент дека peekLast = ' + peekLast);

/* Добавить элементы в дек */
linkedListDeque.pushLast(4);
console.log('После добавления 4 в конец дека linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('После добавления 1 в начало дека linkedListDeque = ');
linkedListDeque.print();

/* Извлечь элементы из дека */
const popLast = linkedListDeque.popLast();
console.log('Извлечённый последний элемент = ' + popLast + ', после извлечения из конца linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('Извлечённый первый элемент = ' + popFirst + ', после извлечения из начала linkedListDeque = ');
linkedListDeque.print();

/* Получить длину дека */
const size = linkedListDeque.size();
console.log('Длина дека size = ' + size);

/* Проверить, пуст ли дек */
const isEmpty = linkedListDeque.isEmpty();
console.log('Дек пуст = ' + isEmpty);
