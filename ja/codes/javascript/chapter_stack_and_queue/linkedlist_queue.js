/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 連結リストで実装したキュー */
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

    /* キューが空か判定 */
    isEmpty() {
        return this.size === 0;
    }

    /* エンキュー */
    push(num) {
        // 末尾ノードの後ろに num を追加する
        const node = new ListNode(num);
        // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // キューが空でない場合、このノードを末尾ノードの後ろに追加する
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* デキュー */
    pop() {
        const num = this.peek();
        // 先頭ノードを削除する
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    peek() {
        if (this.size === 0) throw new Error('キューが空です');
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

/* 実行用コード */
/* キューを初期化する */
const queue = new LinkedListQueue();

/* 要素をエンキューする */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue = ' + queue.toArray());

/* キューの先頭要素にアクセス */
const peek = queue.peek();
console.log('キューの先頭要素 peek = ' + peek);

/* 要素をデキューする */
const pop = queue.pop();
console.log('デキューした要素 pop = ' + pop + '、デキュー後 queue = ' + queue.toArray());

/* キューの長さを取得 */
const size = queue.size;
console.log('キューの長さ size = ' + size);

/* キューが空か判定 */
const isEmpty = queue.isEmpty();
console.log('キューは空か = ' + isEmpty);
