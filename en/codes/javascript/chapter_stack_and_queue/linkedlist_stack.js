/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Stack class based on linked list */
class LinkedListStack {
    #stackPeek; // Use the head node as the top of the stack
    #stkSize = 0; // Length of the stack

    constructor() {
        this.#stackPeek = null;
    }

    /* Get the length of the stack */
    get size() {
        return this.#stkSize;
    }

    /* Determine if the stack is empty */
    isEmpty() {
        return this.size === 0;
    }

    /* Push */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* Pop */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* Access stack top element */
    peek() {
        if (!this.#stackPeek) throw new Error('Stack is empty');
        return this.#stackPeek.val;
    }

    /* Convert the linked list to Array and return */
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

/* Driver Code */
/* Initialize stack */
const stack = new LinkedListStack();

/* Element push */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack =' + stack.toArray());

/* Access stack top element */
const peek = stack.peek();
console.log('Top element peek =' + peek);

/* Element pop */
const pop = stack.pop();
console.log('Element popped from the stack, pop = ' + pop + ', after stack = ' + stack.toArray());

/* Get the length of the stack */
const size = stack.size;
console.log('Length of the stack size =' + size);

/* Determine if it's empty */
const isEmpty = stack.isEmpty();
console.log('Is the stack empty =' + isEmpty);
