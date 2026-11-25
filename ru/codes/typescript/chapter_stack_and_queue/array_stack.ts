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

    /* Получить размер стека */
    get size(): number {
        return this.stack.length;
    }

    /* Проверить, пуст ли стек */
    isEmpty(): boolean {
        return this.stack.length === 0;
    }

    /* Поместить элемент в стек */
    push(num: number): void {
        this.stack.push(num);
    }

    /* Снять элемент со стека */
    pop(): number | undefined {
        if (this.isEmpty()) throw new Error('Стек пуст');
        return this.stack.pop();
    }

    /* Посмотреть элемент на вершине стека */
    top(): number | undefined {
        if (this.isEmpty()) throw new Error('Стек пуст');
        return this.stack[this.stack.length - 1];
    }

    /* Вернуть массив */
    toArray() {
        return this.stack;
    }
}

/* Пример использования */
/* Инициализировать стек */
const stack = new ArrayStack();

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack = ');
console.log(stack.toArray());

/* Посмотреть элемент на вершине стека */
const top = stack.top();
console.log('Элемент на вершине стека top = ' + top);

/* Снять элемент со стека */
const pop = stack.pop();
console.log('Снятый элемент pop = ' + pop + ', после снятия stack = ');
console.log(stack.toArray());

/* Получить размер стека */
const size = stack.size;
console.log('Размер стека size = ' + size);

/* Проверить, пуст ли стек */
const isEmpty = stack.isEmpty();
console.log('Стек пуст = ' + isEmpty);

export {};
