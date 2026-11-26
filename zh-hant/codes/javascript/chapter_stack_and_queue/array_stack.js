/**
 * File: array_stack.js
 * Created Time: 2022-12-09
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 以陣列實作堆疊 */
class ArrayStack {
    #stack;
    constructor() {
        this.#stack = [];
    }

    /* 取得堆疊長度 */
    get size() {
        return this.#stack.length;
    }

    /* 判斷堆疊是否為空 */
    isEmpty() {
        return this.#stack.length === 0;
    }

    /* 推入堆疊 */
    push(num) {
        this.#stack.push(num);
    }

    /* 彈出堆疊頂端的元素 */
    pop() {
        if (this.isEmpty()) throw new Error('堆疊為空');
        return this.#stack.pop();
    }

    /* 讀取堆疊頂端的元素 */
    top() {
        if (this.isEmpty()) throw new Error('堆疊為空');
        return this.#stack[this.#stack.length - 1];
    }

    /* 回傳陣列 */
    toArray() {
        return this.#stack;
    }
}

/* 範例程式 */
/* 初始化堆疊 */
const stack = new ArrayStack();

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('堆疊 stack = ');
console.log(stack.toArray());

/* 讀取堆疊頂端的元素 */
const top = stack.top();
console.log('堆疊頂端元素 top = ' + top);

/* 從堆疊彈出元素 */
const pop = stack.pop();
console.log('彈出的元素 pop = ' + pop + '，彈出後 stack = ');
console.log(stack.toArray());

/* 取得堆疊長度 */
const size = stack.size;
console.log('堆疊長度 size = ' + size);

/* 判斷堆疊是否為空 */
const isEmpty = stack.isEmpty();
console.log('堆疊是否為空 = ' + isEmpty);
