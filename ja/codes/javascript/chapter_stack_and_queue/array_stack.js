/**
 * File: array_stack.js
 * Created Time: 2022-12-09
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 配列ベースのスタック */
class ArrayStack {
    #stack;
    constructor() {
        this.#stack = [];
    }

    /* スタックの長さを取得 */
    get size() {
        return this.#stack.length;
    }

    /* スタックが空かどうかを判定 */
    isEmpty() {
        return this.#stack.length === 0;
    }

    /* プッシュ */
    push(num) {
        this.#stack.push(num);
    }

    /* ポップ */
    pop() {
        if (this.isEmpty()) throw new Error('スタックが空');
        return this.#stack.pop();
    }

    /* スタックトップの要素にアクセス */
    top() {
        if (this.isEmpty()) throw new Error('スタックが空');
        return this.#stack[this.#stack.length - 1];
    }

    /* Array を返す */
    toArray() {
        return this.#stack;
    }
}

/* Driver Code */
/* スタックを初期化 */
const stack = new ArrayStack();

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack = ');
console.log(stack.toArray());

/* スタックトップの要素にアクセス */
const top = stack.top();
console.log('スタックトップ要素 top = ' + top);

/* 要素をポップ */
const pop = stack.pop();
console.log('ポップした要素 pop = ' + pop + '，ポップ後 stack = ');
console.log(stack.toArray());

/* スタックの長さを取得 */
const size = stack.size;
console.log('スタックの長さ size = ' + size);

/* 空かどうかを判定 */
const isEmpty = stack.isEmpty();
console.log('スタックは空か = ' + isEmpty);
