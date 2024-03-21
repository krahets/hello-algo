/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue {
    private front: ListNode | null; // 頭節點 front
    private rear: ListNode | null; // 尾節點 rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* 獲取佇列的長度 */
    get size(): number {
        return this.queSize;
    }

    /* 判斷佇列是否為空 */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* 入列 */
    push(num: number): void {
        // 在尾節點後新增 num
        const node = new ListNode(num);
        // 如果佇列為空，則令頭、尾節點都指向該節點
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // 如果佇列不為空，則將該節點新增到尾節點後
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* 出列 */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('佇列為空');
        // 刪除頭節點
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    peek(): number {
        if (this.size === 0) throw new Error('佇列為空');
        return this.front!.val;
    }

    /* 將鏈結串列轉化為 Array 並返回 */
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

/* Driver Code */
/* 初始化佇列 */
const queue = new LinkedListQueue();

/* 元素入列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('佇列 queue = ' + queue.toArray());

/* 訪問佇列首元素 */
const peek = queue.peek();
console.log('佇列首元素 peek = ' + peek);

/* 元素出列 */
const pop = queue.pop();
console.log('出列元素 pop = ' + pop + '，出列後 queue = ' + queue.toArray());

/* 獲取佇列的長度 */
const size = queue.size;
console.log('佇列長度 size = ' + size);

/* 判斷佇列是否為空 */
const isEmpty = queue.isEmpty();
console.log('佇列是否為空 = ' + isEmpty);

export {};
