/**
 * File: array_stack.ts
 * Created Time: 2022-12-08
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Стек на основе массива */
class ArrayStack {
    private stack: number[];
    constructor() {
        this.stack = [];
    }

    /* Получить длину стека */
    get size(): number {
        return this.stack.length;
    }

    /* Проверить, пуст ли стек */
    isEmpty(): boolean {
        return this.stack.length === 0;
    }

    /* Поместить в стек */
    push(num: number): void {
        this.stack.push(num);
    }

    /* Извлечь из стека */
    pop(): number | undefined {
        if (this.isEmpty()) throw new Error('Стек пуст');
        return this.stack.pop();
    }

    /* Получить верхний элемент стека */
    top(): number | undefined {
        if (this.isEmpty()) throw new Error('Стек пуст');
        return this.stack[this.stack.length - 1];
    }

    /* Вернуть Array */
    toArray() {
        return this.stack;
    }
}

/* Driver Code */
/* Инициализировать стек */
const stack = new ArrayStack();

/* Поместить элемент в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack = ');
console.log(stack.toArray());

/* Получить верхний элемент стека */
const top = stack.top();
console.log('Элемент на вершине стека top = ' + top);

/* Извлечь элемент из стека */
const pop = stack.pop();
console.log('Элемент, извлеченный из стека, pop = ' + pop + ', stack после извлечения = ');
console.log(stack.toArray());

/* Получить длину стека */
const size = stack.size;
console.log('Длина стека size =' + size);

/* Проверить, пуста ли структура */
const isEmpty = stack.isEmpty();
console.log('стекпуст ли =' + isEmpty);

export {};
