/**
 * File: linkedlist_stack.ts
 * Created Time: 2022-12-21
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* 連結リストで実装したスタック */
class LinkedListStack {
    private stackPeek: ListNode | null; // 先頭ノードをスタックの先頭とする
    private stkSize: number = 0; // スタックの長さ

    constructor() {
        this.stackPeek = null;
    }

    /* スタックの長さを取得する */
    get size(): number {
        return this.stkSize;
    }

    /* スタックが空かどうかを判定する */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* プッシュ */
    push(num: number): void {
        const node = new ListNode(num);
        node.next = this.stackPeek;
        this.stackPeek = node;
        this.stkSize++;
    }

    /* ポップ */
    pop(): number {
        const num = this.peek();
        if (!this.stackPeek) throw new Error('スタックが空です');
        this.stackPeek = this.stackPeek.next;
        this.stkSize--;
        return num;
    }

    /* スタックの先頭要素にアクセスする */
    peek(): number {
        if (!this.stackPeek) throw new Error('スタックが空です');
        return this.stackPeek.val;
    }

    /* 連結リストを Array に変換して返す */
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

export {};
