/**
 * File: array_queue.ts
 * Created Time: 2022-12-11
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    private nums: number[]; // Массив для хранения элементов очереди
    private front: number; // Указатель head, указывающий на первый элемент очереди
    private queSize: number; // Длина очереди

    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = this.queSize = 0;
    }

    /* Получить вместимость очереди */
    get capacity(): number {
        return this.nums.length;
    }

    /* Получение длины очереди */
    get size(): number {
        return this.queSize;
    }

    /* Проверка, пуста ли очередь */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Поместить в очередь */
    push(num: number): void {
        if (this.size === this.capacity) {
            console.log('Очередь заполнена');
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        const rear = (this.front + this.queSize) % this.capacity;
        // Добавить num в хвост очереди
        this.nums[rear] = num;
        this.queSize++;
    }

    /* Извлечь из очереди */
    pop(): number {
        const num = this.peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        this.front = (this.front + 1) % this.capacity;
        this.queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    peek(): number {
        if (this.isEmpty()) throw new Error('очередь пуста');
        return this.nums[this.front];
    }

    /* Вернуть Array */
    toArray(): number[] {
        // Преобразовывать только элементы списка в пределах фактической длины
        const arr = new Array(this.size);
        for (let i = 0, j = this.front; i < this.size; i++, j++) {
            arr[i] = this.nums[j % this.capacity];
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
console.log('Элемент в начале очереди peek = ' + peek);

/* Извлечение элемента из очереди */
const pop = queue.pop();
console.log('Извлечен элемент pop = ' + pop + ', очередь после извлечения queue =', queue.toArray());

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
    console.log('После ' + i + '-го добавления и извлечения queue =', queue.toArray());
}

export {};
