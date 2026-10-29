/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 連結リストで実装したスタック */
class LinkedListStack {
    #stackPeek; // 先頭ノードをスタックの先頭とする
    #stkSize = 0; // スタックの長さ

    constructor() {
        this.#stackPeek = null;
    }

    /* スタックの長さを取得する */
    get size() {
        return this.#stkSize;
    }

    /* スタックが空かどうかを判定する */
    isEmpty() {
        return this.size === 0;
    }

    /* プッシュ */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* ポップ */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* スタックの先頭要素にアクセスする */
    peek() {
        if (!this.#stackPeek) throw new Error('スタックが空です');
        return this.#stackPeek.val;
    }

    /* 連結リストを Array に変換して返す */
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

/* 実行用コード */
/* スタックを初期化する */
const stack = new LinkedListStack();

/* 要素をプッシュする */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack = ' + stack.toArray());

/* スタックの先頭要素にアクセスする */
const peek = stack.peek();
console.log('スタックの先頭要素 peek = ' + peek);

/* 要素をポップする */
const pop = stack.pop();
console.log('ポップした要素 pop = ' + pop + '、ポップ後 stack = ' + stack.toArray());

/* スタックの長さを取得する */
const size = stack.size;
console.log('スタックの長さ size = ' + size);

/* 空かどうかを判定する */
const isEmpty = stack.isEmpty();
console.log('スタックは空か = ' + isEmpty);
