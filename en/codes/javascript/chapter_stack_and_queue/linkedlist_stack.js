/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Stack backed by a linked list */
class LinkedListStack {
    #stackPeek; // Use the head node as the top of the stack
    #stkSize = 0; // Stack size

    constructor() {
        this.#stackPeek = null;
    }

    /* Get the stack size */
    get size() {
        return this.#stkSize;
    }

    /* Check whether the stack is empty */
    isEmpty() {
        return this.size === 0;
    }

    /* Push an element onto the stack */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* Remove and return the top element */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* Peek at the top element */
    peek() {
        if (!this.#stackPeek) throw new Error('Stack is empty');
        return this.#stackPeek.val;
    }

    /* Return the linked list elements as an array */
    toArray() {
        let node = this.#stackPeek;
        const res = new Array(this.size);
        for (let i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

/* Driver code */
/* Initialize the stack */
const stack = new LinkedListStack();

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('stack = ' + stack.toArray());

/* Peek at the top element */
const peek = stack.peek();
console.log('Top element (peek) = ' + peek);

/* Pop the top element */
const pop = stack.pop();
console.log('Popped element (pop) = ' + pop + ', stack after the pop = ' + stack.toArray());

/* Get the stack size */
const size = stack.size;
console.log('Stack size = ' + size);

/* Check whether the stack is empty */
const isEmpty = stack.isEmpty();
console.log('Stack is empty = ' + isEmpty);
