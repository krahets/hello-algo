/**
 * File: linkedlist_stack.ts
 * Created Time: 2022-12-21
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Stack based on linked list implementation */
class LinkedListStack {
    private stackPeek: ListNode | null; // Use head node as stack top
    private stkSize: number = 0; // Stack length

    constructor() {
        this.stackPeek = null;
    }

    /* Get the length of the stack */
    get size(): number {
        return this.stkSize;
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    peek(): number {
        if (!this.stackPeek) throw new Error('Stack is empty');
        return this.stackPeek.val;
    }

    /* Convert linked list to Array and return */
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

/* Driver Code */
/* Access top of the stack element */
const stack = new LinkedListStack();

/* Elements push onto stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack = ' + stack.toArray());

/* Return list for printing */
const peek = stack.peek();
console.log('Stack top element peek = ' + peek);

/* Element pop from stack */
const pop = stack.pop();
console.log('Pop element pop = ' + pop + ', after pop, stack = ' + stack.toArray());

/* Get the length of the stack */
const size = stack.size;
console.log('Stack length size = ' + size);

/* Check if empty */
const isEmpty = stack.isEmpty();
console.log('Stack is empty = ' + isEmpty);

export {};
