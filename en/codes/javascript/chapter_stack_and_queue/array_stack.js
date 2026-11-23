/**
 * File: array_stack.js
 * Created Time: 2022-12-09
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Stack implemented with an array */
class ArrayStack {
    #stack;
    constructor() {
        this.#stack = [];
    }

    /* Get the stack size */
    get size() {
        return this.#stack.length;
    }

    /* Check whether the stack is empty */
    isEmpty() {
        return this.#stack.length === 0;
    }

    /* Push */
    push(num) {
        this.#stack.push(num);
    }

    /* Pop */
    pop() {
        if (this.isEmpty()) throw new Error('Stack is empty');
        return this.#stack.pop();
    }

    /* Access the top element */
    top() {
        if (this.isEmpty()) throw new Error('Stack is empty');
        return this.#stack[this.#stack.length - 1];
    }

    /* Return an Array */
    toArray() {
        return this.#stack;
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
console.log('Stack stack = ');
console.log(stack.toArray());

/* Access the top element */
const top = stack.top();
console.log('Top element top = ' + top);

/* Pop an element from the stack */
const pop = stack.pop();
console.log('Popped element pop = ' + pop + '; after popping, stack = ');
console.log(stack.toArray());

/* Get the stack size */
const size = stack.size;
console.log('Stack size = ' + size);

/* Check whether it is empty */
const isEmpty = stack.isEmpty();
console.log('Is the stack empty = ' + isEmpty);
