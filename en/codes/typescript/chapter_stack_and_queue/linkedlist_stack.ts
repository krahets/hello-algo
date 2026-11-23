/**
 * File: linkedlist_stack.ts
 * Created Time: 2022-12-21
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Stack implemented with a linked list */
class LinkedListStack {
    private stackPeek: ListNode | null; // Use the head node as the stack top
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

    /* Push */
    push(num: number): void {
        const node = new ListNode(num);
        node.next = this.stackPeek;
        this.stackPeek = node;
        this.stkSize++;
    }

    /* Pop */
    pop(): number {
        const num = this.peek();
        if (!this.stackPeek) throw new Error('Stack is empty');
        this.stackPeek = this.stackPeek.next;
        this.stkSize--;
        return num;
    }

    /* Access the top element */
    peek(): number {
        if (!this.stackPeek) throw new Error('Stack is empty');
        return this.stackPeek.val;
    }

    /* Convert the linked list to an Array and return it */
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
console.log('Stack stack = ' + stack.toArray());

/* Access the top element */
const peek = stack.peek();
console.log('Top element peek = ' + peek);

/* Pop an element from the stack */
const pop = stack.pop();
console.log('Popped element pop = ' + pop + '; after popping, stack = ' + stack.toArray());

/* Get the stack size */
const size = stack.size;
console.log('Stack size = ' + size);

/* Check whether it is empty */
const isEmpty = stack.isEmpty();
console.log('Is the stack empty = ' + isEmpty);

export {};
