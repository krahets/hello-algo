/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 連結リストベースのキュー */
class LinkedListQueue {
    private front: ListNode | null; // 先頭ノード front
    private rear: ListNode | null; // 末尾ノード rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* キューの長さを取得 */
    get size(): number {
        return this.queSize;
    }

    /* キューが空かどうかを判定 */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* エンキュー */
    push(num: number): void {
        // 末尾ノードの後ろに num を追加
        const node = new ListNode(num);
        // キューが空なら、先頭・末尾ノードをともにそのノードに設定
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // キューが空でなければ、そのノードを末尾ノードの後ろに追加
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* デキュー */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('キューが空です');
        // 先頭ノードを削除
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    peek(): number {
        if (this.size === 0) throw new Error('キューが空です');
        return this.front!.val;
    }

    /* 連結リストを Array に変換して返す */
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
/* キューを初期化 */
const queue = new LinkedListQueue();

/* 要素をエンキュー */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue = ' + queue.toArray());

/* キュー先頭の要素にアクセス */
const peek = queue.peek();
console.log('先頭要素 peek = ' + peek);

/* 要素をデキュー */
const pop = queue.pop();
console.log('デキューした要素 pop = ' + pop + '，デキュー後の queue = ' + queue.toArray());

/* キューの長さを取得 */
const size = queue.size;
console.log('キューの長さ size = ' + size);

/* キューが空かどうかを判定 */
const isEmpty = queue.isEmpty();
console.log('キューが空かどうか = ' + isEmpty);

export {};
