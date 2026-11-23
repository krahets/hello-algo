/**
 * File: array_stack.js
 * Created Time: 2022-12-09
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 配列で実装したスタック */
class ArrayStack {
    #stack;
    constructor() {
        this.#stack = [];
    }

    /* スタックの長さを取得する */
    get size() {
        return this.#stack.length;
    }

    /* スタックが空かどうかを判定する */
    isEmpty() {
        return this.#stack.length === 0;
    }

    /* プッシュ */
    push(num) {
        this.#stack.push(num);
    }

    /* ポップ */
    pop() {
        if (this.isEmpty()) throw new Error('スタックが空です');
        return this.#stack.pop();
    }

    /* スタックの先頭要素にアクセスする */
    top() {
        if (this.isEmpty()) throw new Error('スタックが空です');
        return this.#stack[this.#stack.length - 1];
    }

    /* Array を返す */
    toArray() {
        return this.#stack;
    }
}

/* 実行用コード */
/* スタックを初期化する */
const stack = new ArrayStack();

/* 要素をプッシュする */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack = ');
console.log(stack.toArray());

/* スタックの先頭要素にアクセスする */
const top = stack.top();
console.log('スタックの先頭要素 top = ' + top);

/* 要素をポップする */
const pop = stack.pop();
console.log('ポップした要素 pop = ' + pop + '、ポップ後 stack = ');
console.log(stack.toArray());

/* スタックの長さを取得する */
const size = stack.size;
console.log('スタックの長さ size = ' + size);

/* 空かどうかを判定する */
const isEmpty = stack.isEmpty();
console.log('スタックは空か = ' + isEmpty);
