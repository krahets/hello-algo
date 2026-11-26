/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 以鏈結串列實作佇列 */
class LinkedListQueue {
    private front: ListNode | null; // front 指向首節點
    private rear: ListNode | null; // rear 指向尾節點
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* 取得佇列長度 */
    get size(): number {
        return this.queSize;
    }

    /* 判斷佇列是否為空 */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* 入隊 */
    push(num: number): void {
        // 建立存有 num 的新節點，準備接到隊尾
        const node = new ListNode(num);
        // 若佇列為空，讓隊首與隊尾都指向新節點
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // 若佇列非空，將新節點接在尾節點之後
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* 出隊 */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('佇列為空');
        // 移除首節點
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    peek(): number {
        if (this.size === 0) throw new Error('佇列為空');
        return this.front!.val;
    }

    /* 將鏈結串列轉成陣列並回傳 */
    toArray(): number[] {
        let node = this.front;
        const res = new Array<number>(this.size);
        for (let i = 0; i < res.length; i++) {
            res[i] = node!.val;
            node = node!.next;
        }
        return res;
    }
}

/* 範例程式 */
/* 初始化佇列 */
const queue = new LinkedListQueue();

/* 將元素加入佇列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('佇列 queue = ' + queue.toArray());

/* 讀取隊首元素 */
const peek = queue.peek();
console.log('隊首元素 peek = ' + peek);

/* 從佇列取出元素 */
const pop = queue.pop();
console.log('出隊元素 pop = ' + pop + '，出隊後 queue = ' + queue.toArray());

/* 取得佇列長度 */
const size = queue.size;
console.log('佇列長度 size = ' + size);

/* 判斷佇列是否為空 */
const isEmpty = queue.isEmpty();
console.log('佇列是否為空 = ' + isEmpty);

export {};
