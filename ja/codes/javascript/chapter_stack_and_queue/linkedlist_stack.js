/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 連結リストを使ったスタック */
class LinkedListStack {
    #stackPeek; // 先頭ノードをスタックのトップとする
    #stkSize = 0; // スタックの要素数

    constructor() {
        this.#stackPeek = null;
    }

    /* スタックの要素数を取得する */
    get size() {
        return this.#stkSize;
    }

    /* スタックが空かどうかを判定する */
    isEmpty() {
        return this.size === 0;
    }

    /* プッシュする */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* ポップする */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* スタックのトップを参照する */
    peek() {
        if (!this.#stackPeek) throw new Error('スタックが空です');
        return this.#stackPeek.val;
    }

    /* 連結リストを配列に変換して返す */
    toArray() {
        let node = this.#stackPeek;
        const res = new Array(this.size);
        for (let i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

/* 実行例 */
/* スタックを初期化する */
const stack = new LinkedListStack();

/* 要素をプッシュする */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack = ' + stack.toArray());

/* スタックのトップを参照する */
const peek = stack.peek();
console.log('スタックのトップの要素 peek = ' + peek);

/* 要素をポップする */
const pop = stack.pop();
console.log('ポップした要素 pop = ' + pop + '、ポップ後の stack = ' + stack.toArray());

/* スタックの要素数を取得する */
const size = stack.size;
console.log('スタックの要素数 size = ' + size);

/* 空かどうかを判定する */
const isEmpty = stack.isEmpty();
console.log('スタックは空か = ' + isEmpty);
