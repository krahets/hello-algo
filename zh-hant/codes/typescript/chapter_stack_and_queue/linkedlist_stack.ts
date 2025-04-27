/**
 * File: linkedlist_stack.ts
 * Created Time: 2022-12-21
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 基於鏈結串列實現的堆疊 */
class LinkedListStack {
    private stackPeek: ListNode | null; // 將頭節點作為堆疊頂
    private stkSize: number = 0; // 堆疊的長度

    constructor() {
        this.stackPeek = null;
    }

    /* 獲取堆疊的長度 */
    get size(): number {
        return this.stkSize;
    }

    /* 判斷堆疊是否為空 */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* 入堆疊 */
    push(num: number): void {
        const node = new ListNode(num);
        node.next = this.stackPeek;
        this.stackPeek = node;
        this.stkSize++;
    }

    /* 出堆疊 */
    pop(): number {
        const num = this.peek();
        if (!this.stackPeek) throw new Error('堆疊為空');
        this.stackPeek = this.stackPeek.next;
        this.stkSize--;
        return num;
    }

    /* 訪問堆疊頂元素 */
    peek(): number {
        if (!this.stackPeek) throw new Error('堆疊為空');
        return this.stackPeek.val;
    }

    /* 將鏈結串列轉化為 Array 並返回 */
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
/* 初始化堆疊 */
const stack = new LinkedListStack();

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('堆疊 stack = ' + stack.toArray());

/* 訪問堆疊頂元素 */
const peek = stack.peek();
console.log('堆疊頂元素 peek = ' + peek);

/* 元素出堆疊 */
const pop = stack.pop();
console.log('出堆疊元素 pop = ' + pop + '，出堆疊後 stack = ' + stack.toArray());

/* 獲取堆疊的長度 */
const size = stack.size;
console.log('堆疊的長度 size = ' + size);

/* 判斷是否為空 */
const isEmpty = stack.isEmpty();
console.log('堆疊是否為空 = ' + isEmpty);

export {};
