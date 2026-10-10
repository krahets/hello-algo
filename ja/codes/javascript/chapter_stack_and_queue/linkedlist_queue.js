/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 連結リストベースのキュー */
class LinkedListQueue {
    #front; // 先頭ノード #front
    #rear; // 末尾ノード #rear
    #queSize = 0;

    constructor() {
        this.#front = null;
        this.#rear = null;
    }

    /* キューの長さを取得 */
    get size() {
        return this.#queSize;
    }

    /* キューが空かどうかを判定 */
    isEmpty() {
        return this.size === 0;
    }

    /* エンキュー */
    push(num) {
        // 末尾ノードの後ろに num を追加
        const node = new ListNode(num);
        // キューが空なら、先頭・末尾ノードをともにそのノードに設定
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // キューが空でなければ、そのノードを末尾ノードの後ろに追加
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* デキュー */
    pop() {
        const num = this.peek();
        // 先頭ノードを削除
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    peek() {
        if (this.size === 0) throw new Error('キューが空');
        return this.#front.val;
    }

    /* 連結リストを Array に変換して返す */
    toArray() {
        let node = this.#front;
        const res = new Array(this.size);
        for (let i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
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
console.log('デキューした要素 pop = ' + pop + '，デキュー後 queue = ' + queue.toArray());

/* キューの長さを取得 */
const size = queue.size;
console.log('キューの長さ size = ' + size);

/* キューが空かどうかを判定 */
const isEmpty = queue.isEmpty();
console.log('キューは空か = ' + isEmpty);
