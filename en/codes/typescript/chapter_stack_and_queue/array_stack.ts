/**
 * File: array_stack.ts
 * Created Time: 2022-12-08
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Array-backed stack */
class ArrayStack {
    private stack: number[];
    constructor() {
        this.stack = [];
    }

    /* Get the stack size */
    get size(): number {
        return this.stack.length;
    }

    /* Check whether the stack is empty */
    isEmpty(): boolean {
        return this.stack.length === 0;
    }

    /* Push an element onto the stack */
    push(num: number): void {
        this.stack.push(num);
    }

    /* Remove and return the top element */
    pop(): number | undefined {
        if (this.isEmpty()) throw new Error('Stack is empty');
        return this.stack.pop();
    }

    /* Peek at the top element */
    top(): number | undefined {
        if (this.isEmpty()) throw new Error('Stack is empty');
        return this.stack[this.stack.length - 1];
    }

    /* Return the backing array */
    toArray() {
        return this.stack;
    }
}

/* Driver code */
/* Initialize the stack */
const stack = new ArrayStack();

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('stack = ');
console.log(stack.toArray());

/* Peek at the top element */
const top = stack.top();
console.log('Top element (top) = ' + top);

/* Pop the top element */
const pop = stack.pop();
console.log('Popped element (pop) = ' + pop + ', stack after the pop = ');
console.log(stack.toArray());

/* Get the stack size */
const size = stack.size;
console.log('Stack size = ' + size);

/* Check whether the stack is empty */
const isEmpty = stack.isEmpty();
console.log('Stack is empty = ' + isEmpty);

export {};
