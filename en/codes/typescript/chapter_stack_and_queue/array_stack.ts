/**
 * File: array_stack.ts
 * Created Time: 2022-12-08
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Stack class based on array */
class ArrayStack {
    private stack: number[];
    constructor() {
        this.stack = [];
    }

    /* Get the length of the stack */
    get size(): number {
        return this.stack.length;
    }

    /* Determine if the stack is empty */
    isEmpty(): boolean {
        return this.stack.length === 0;
    }

    /* Push */
    push(num: number): void {
        this.stack.push(num);
    }

    /* Pop */
    pop(): number | undefined {
        if (this.isEmpty()) throw new Error('Stack is empty');
        return this.stack.pop();
    }

    /* Access stack top element */
    top(): number | undefined {
        if (this.isEmpty()) throw new Error('Stack is empty');
        return this.stack[this.stack.length - 1];
    }

    /* Return Array */
    toArray() {
        return this.stack;
    }
}

/* Driver Code */
/* Initialize stack */
const stack = new ArrayStack();

/* Element push */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack =');
console.log(stack.toArray());

/* Access stack top element */
const top = stack.top();
console.log('Top element of the stack top = ' + top);

/* Element pop */
const pop = stack.pop();
console.log('Element popped from the stack, pop = ' + pop + ', after stack = ');
console.log(stack.toArray());

/* Get the length of the stack */
const size = stack.size;
console.log('Length of the stack size =' + size);

/* Determine if it's empty */
const isEmpty = stack.isEmpty();
console.log('Is the stack empty =' + isEmpty);

export {};
