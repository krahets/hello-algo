/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 連結リストを使ったキュー */
class LinkedListQueue {
    private front: ListNode | null; // 先頭ノード front
    private rear: ListNode | null; // 末尾ノード rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* キューの要素数を取得する */
    get size(): number {
        return this.queSize;
    }

    /* キューが空かどうかを判定する */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* エンキューする */
    push(num: number): void {
        // 値が num のノードを末尾ノードの後ろに追加する
        const node = new ListNode(num);
        // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* デキューする */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('キューが空です');
        // 先頭ノードを削除する
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    peek(): number {
        if (this.size === 0) throw new Error('キューが空です');
        return this.front!.val;
    }

    /* 連結リストを配列に変換して返す */
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

/* 実行例 */
/* キューを初期化する */
const queue = new LinkedListQueue();

/* 要素をキューに追加する */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue = ' + queue.toArray());

/* キューの先頭要素を参照する */
const peek = queue.peek();
console.log('先頭要素 peek = ' + peek);

/* キューから要素を取り出す */
const pop = queue.pop();
console.log('デキューした要素 pop = ' + pop + '、デキュー後の queue = ' + queue.toArray());

/* キューの要素数を取得する */
const size = queue.size;
console.log('キューの要素数 size = ' + size);

/* キューが空かどうかを判定する */
const isEmpty = queue.isEmpty();
console.log('キューは空か = ' + isEmpty);

export {};
