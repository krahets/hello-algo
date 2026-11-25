/**
 * File: linkedlist_stack.ts
 * Created Time: 2022-12-21
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Stack backed by a linked list */
class LinkedListStack {
    private stackPeek: ListNode | null; // Use the head node as the top of the stack
    private stkSize: number = 0; // Stack size

    constructor() {
        this.stackPeek = null;
    }

    /* Get the stack size */
    get size(): number {
        return this.stkSize;
    }

    /* Check whether the stack is empty */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* Push an element onto the stack */
    push(num: number): void {
        const node = new ListNode(num);
        node.next = this.stackPeek;
        this.stackPeek = node;
        this.stkSize++;
    }

    /* Remove and return the top element */
    pop(): number {
        const num = this.peek();
        if (!this.stackPeek) throw new Error('Stack is empty');
        this.stackPeek = this.stackPeek.next;
        this.stkSize--;
        return num;
    }

    /* Peek at the top element */
    peek(): number {
        if (!this.stackPeek) throw new Error('Stack is empty');
        return this.stackPeek.val;
    }

    /* Return the linked list elements as an array */
    toArray(): number[] {
        let node = this.stackPeek;
        const res = new Array<number>(this.size);
        for (let i = res.length - 1; i >= 0; i--) {
            res[i] = node!.val;
            node = node!.next;
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

export {};
