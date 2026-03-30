/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    prev: ListNode; // Ссылка на узел-предшественник (указатель)
    next: ListNode; // Ссылка на узел-преемник (указатель)
    val: number; // Значение узла

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
    private front: ListNode; // Головной узел front
    private rear: ListNode; // Хвостовой узел rear
    private queSize: number; // Длина двусторонней очереди

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* Операция добавления в хвост очереди */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Добавить node в хвост списка
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // Обновить хвостовой узел
        }
        this.queSize++;
    }

    /* Операция добавления в голову очереди */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Добавить node в голову списка
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // Обновить головной узел
        }
        this.queSize++;
    }

    /* Операция извлечения из хвоста очереди */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear.val; // Сохранить значение хвостового узла
        // Удалить хвостовой узел
        let temp: ListNode = this.rear.prev;
        if (temp !== null) {
            temp.next = null;
            this.rear.prev = null;
        }
        this.rear = temp; // Обновить хвостовой узел
        this.queSize--;
        return value;
    }

    /* Операция извлечения из головы очереди */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // Сохранить значение хвостового узла
        // Удалить головной узел
        let temp: ListNode = this.front.next;
        if (temp !== null) {
            temp.prev = null;
            this.front.next = null;
        }
        this.front = temp; // Обновить головной узел
        this.queSize--;
        return value;
    }

    /* Доступ к элементу в конце очереди */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* Доступ к элементу в начале очереди */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* Получение длины двусторонней очереди */
    size(): number {
        return this.queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Вывести двустороннюю очередь */
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

/* Driver Code */
/* Инициализация двусторонней очереди */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Двусторонняя очередь linkedListDeque = ');
linkedListDeque.print();

/* Доступ к элементу */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('Элемент в начале очереди peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('Элемент в конце очереди peekLast = ' + peekLast);

/* Добавление элемента в очередь */
linkedListDeque.pushLast(4);
console.log('После добавления элемента 4 в хвост linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('После добавления элемента 1 в голову linkedListDeque = ');
linkedListDeque.print();

/* Извлечение элемента из очереди */
const popLast: number = linkedListDeque.popLast();
console.log('Извлечен элемент из хвоста = ' + popLast + ', linkedListDeque после извлечения из хвоста = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('Извлечен элемент из головы = ' + popFirst + ', linkedListDeque после извлечения из головы = ');
linkedListDeque.print();

/* Получение длины двусторонней очереди */
const size: number = linkedListDeque.size();
console.log('Длина двусторонней очереди size = ' + size);

/* Проверка, пуста ли двусторонняя очередь */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('Пуста ли двусторонняя очередь = ' + isEmpty);
