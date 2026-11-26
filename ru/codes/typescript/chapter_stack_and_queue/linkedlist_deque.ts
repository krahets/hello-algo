/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    prev: ListNode | null; // Ссылка (указатель) на предыдущий узел
    next: ListNode | null; // Ссылка (указатель) на следующий узел
    val: number; // Значение узла

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
    private front: ListNode; // Первый узел front
    private rear: ListNode; // Последний узел rear
    private queSize: number; // Длина дека

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* Добавить элемент в конец дека */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Добавить node в конец связного списка
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // Обновить ссылку на последний узел
        }
        this.queSize++;
    }

    /* Добавить элемент в начало дека */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Добавить node в начало связного списка
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // Обновить ссылку на первый узел
        }
        this.queSize++;
    }

    /* Извлечь элемент из конца дека */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // Сохранить значение последнего узла
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // Удалить последний узел
        else {
            let temp: ListNode = this.rear!.prev;
            temp!.next = null;
            this.rear!.prev = null;
            this.rear = temp; // Обновить ссылку на последний узел
        }
        this.queSize--;
        return value;
    }

    /* Извлечь элемент из начала дека */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // Сохранить значение первого узла
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // Удалить первый узел
        else {
            let temp: ListNode = this.front!.next;
            temp!.prev = null;
            this.front!.next = null;
            this.front = temp; // Обновить ссылку на первый узел
        }
        this.queSize--;
        return value;
    }

    /* Посмотреть последний элемент дека */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* Посмотреть первый элемент дека */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* Получить длину дека */
    size(): number {
        return this.queSize;
    }

    /* Проверить, пуст ли дек */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Вывести дек */
    print(): void {
        const arr: number[] = [];
        let temp: ListNode = this.front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* Пример использования */
/* Инициализировать дек */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Дек linkedListDeque = ');
linkedListDeque.print();

/* Посмотреть первый и последний элементы */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('Первый элемент дека peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('Последний элемент дека peekLast = ' + peekLast);

/* Добавить элементы в дек */
linkedListDeque.pushLast(4);
console.log('После добавления 4 в конец дека linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('После добавления 1 в начало дека linkedListDeque = ');
linkedListDeque.print();

/* Извлечь элементы из дека */
const popLast: number = linkedListDeque.popLast();
console.log('Извлечённый последний элемент = ' + popLast + ', после извлечения из конца linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('Извлечённый первый элемент = ' + popFirst + ', после извлечения из начала linkedListDeque = ');
linkedListDeque.print();

/* Получить длину дека */
const size: number = linkedListDeque.size();
console.log('Длина дека size = ' + size);

/* Проверить, пуст ли дек */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('Дек пуст = ' + isEmpty);
