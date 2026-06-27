/**
 * File: array_stack.ts
 * Created Time: 2022-12-08
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Stack based on array implementation */
class ArrayStack {
    private stack: number[];
    constructor() {
        this.stack = [];
    }

    /* Get the length of the stack */
    get size(): number {
        return this.stack.length;
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
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
/* Access top of the stack element */
const stack = new ArrayStack();

/* Elements push onto stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack = ');
console.log(stack.toArray());

/* Return list for printing */
const top = stack.top();
console.log('Stack top element top = ' + top);

/* Element pop from stack */
const pop = stack.pop();
console.log('Pop element pop = ' + pop + ', after pop, stack = ');
console.log(stack.toArray());

/* Get the length of the stack */
const size = stack.size;
console.log('Stack length size = ' + size);

/* Check if empty */
const isEmpty = stack.isEmpty();
console.log('Stack is empty = ' + isEmpty);

export {};
