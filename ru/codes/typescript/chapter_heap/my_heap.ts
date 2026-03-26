/**
 * File: my_heap.ts
 * Created Time: 2023-02-07
 * Author: Justin (xiefahit@gmail.com)
 */

import { printHeap } from '../modules/PrintUtil';

/* максимальныйкучакласс */
class MaxHeap {
    private maxHeap: number[];
    /* Конструктор, создающий пустую кучу или строящий кучу по входному списку */
    constructor(nums?: number[]) {
        // Добавить элементы списка в кучу без изменений
        this.maxHeap = nums === undefined ? [] : [...nums];
        // Выполнить heapify для всех узлов, кроме листовых
        for (let i = this.parent(this.size() - 1); i >= 0; i--) {
            this.siftDown(i);
        }
    }

    /* Получить индекс левого дочернего узла */
    private left(i: number): number {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла */
    private right(i: number): number {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла */
    private parent(i: number): number {
        return Math.floor((i - 1) / 2); // Округление вниз при делении
    }

    /* Поменять элементы местами */
    private swap(i: number, j: number): void {
        const tmp = this.maxHeap[i];
        this.maxHeap[i] = this.maxHeap[j];
        this.maxHeap[j] = tmp;
    }

    /* Получить размер кучи */
    public size(): number {
        return this.maxHeap.length;
    }

    /* Проверить, пуста ли куча */
    public isEmpty(): boolean {
        return this.size() === 0;
    }

    /* Обратиться к элементу на вершине кучи */
    public peek(): number {
        return this.maxHeap[0];
    }

    /* Добавить элемент в кучу */
    public push(val: number): void {
        // Добавить узел
        this.maxHeap.push(val);
        // Выполнить heapify снизу вверх
        this.siftUp(this.size() - 1);
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private siftUp(i: number): void {
        while (true) {
            // Получить родительский узел для узла i
            const p = this.parent(i);
            // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
            if (p < 0 || this.maxHeap[i] <= this.maxHeap[p]) break;
            // Поменять местами два узла
            this.swap(i, p);
            // Циклически выполнять просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    public pop(): number {
        // Обработка пустого случая
        if (this.isEmpty()) throw new RangeError('Heap is empty.');
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        this.swap(0, this.size() - 1);
        // Удалить узел
        const val = this.maxHeap.pop();
        // Выполнить heapify сверху вниз
        this.siftDown(0);
        // Вернуть элемент на вершине кучи
        return val;
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    private siftDown(i: number): void {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            const l = this.left(i),
                r = this.right(i);
            let ma = i;
            if (l < this.size() && this.maxHeap[l] > this.maxHeap[ma]) ma = l;
            if (r < this.size() && this.maxHeap[r] > this.maxHeap[ma]) ma = r;
            // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if (ma === i) break;
            // Поменять местами два узла
            this.swap(i, ma);
            // Циклически выполнять просеивание вниз
            i = ma;
        }
    }

    /* Вывести кучу (в виде двоичного дерева) */
    public print(): void {
        printHeap(this.maxHeap);
    }

    /* Извлечь элемент из кучи */
    public getMaxHeap(): number[] {
        return this.maxHeap;
    }
}

/* Driver Code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* Инициализировать max-кучу */
    const maxHeap = new MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
    console.log('\nВходной список и построение кучипосле');
    maxHeap.print();

    /* Получить верхний элемент кучи */
    let peek = maxHeap.peek();
    console.log(`\nЭлемент на вершине кучи равен ${peek}`);

    /* Добавить элемент в кучу */
    const val = 7;
    maxHeap.push(val);
    console.log(`\nЭлемент ${val} после добавления в кучу`);
    maxHeap.print();

    /* Извлечь верхний элемент из кучи */
    peek = maxHeap.pop();
    console.log(`\nвершина кучиЭлемент ${peek} после извлечения из кучи`);
    maxHeap.print();

    /* Получить размер кучи */
    const size = maxHeap.size();
    console.log(`\nКоличество элементов в куче равно ${size}`);

    /* Проверить, пуста ли куча */
    const isEmpty = maxHeap.isEmpty();
    console.log(`\nКуча пуста: ${isEmpty}`);
}

export { MaxHeap };
