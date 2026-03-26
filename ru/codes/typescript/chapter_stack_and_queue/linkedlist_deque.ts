/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    prev: ListNode; // Ссылка на предыдущий узел (указатель)
    next: ListNode; // Ссылка на следующий узел (указатель)
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

    /* Операция помещения в хвост очереди */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Добавить node в хвост связного списка
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // Обновить хвостовой узел
        }
        this.queSize++;
    }

    /* Операция помещения в голову очереди */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Добавить node в голову связного списка
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

    /* Обратиться к элементу в хвосте очереди */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* Получить элемент в начале очереди */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* Получить длину двусторонней очереди */
    size(): number {
        return this.queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
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
/* Инициализировать двустороннюю очередь */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('двусторонняя очередь linkedListDeque =');
linkedListDeque.print();

/* Получить доступ к элементу */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('элемент в голове очереди peekFirst =' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('элемент в хвосте очереди peekLast =' + peekLast);

/* Поместить элемент в очередь */
linkedListDeque.pushLast(4);
console.log('После помещения элемента 4 в хвост очереди linkedListDeque =');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('После помещения элемента 1 в голову очереди linkedListDeque =');
linkedListDeque.print();

/* Извлечь элемент из очереди */
const popLast: number = linkedListDeque.popLast();
console.log('Элемент, извлеченный из хвоста очереди, =' + popLast + ', linkedListDeque после извлечения из хвоста =');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('Элемент, извлеченный из головы очереди, =' + popFirst + ', linkedListDeque после извлечения из головы =');
linkedListDeque.print();

/* Получить длину двусторонней очереди */
const size: number = linkedListDeque.size();
console.log('Длина двусторонней очереди size =' + size);

/* Проверить, пуста ли двусторонняя очередь */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('двусторонняя Очередь пуста:' + isEmpty);
