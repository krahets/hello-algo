/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 以鏈結串列實作堆疊 */
class LinkedListStack {
    #stackPeek; // 以首節點作為堆疊頂端
    #stkSize = 0; // 堆疊長度

    constructor() {
        this.#stackPeek = null;
    }

    /* 取得堆疊長度 */
    get size() {
        return this.#stkSize;
    }

    /* 判斷堆疊是否為空 */
    isEmpty() {
        return this.size === 0;
    }

    /* 推入堆疊 */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* 彈出堆疊頂端的元素 */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* 讀取堆疊頂端的元素 */
    peek() {
        if (!this.#stackPeek) throw new Error('堆疊為空');
        return this.#stackPeek.val;
    }

    /* 將鏈結串列轉成陣列並回傳 */
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

/* 範例程式 */
/* 初始化堆疊 */
const stack = new LinkedListStack();

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('堆疊 stack = ' + stack.toArray());

/* 讀取堆疊頂端的元素 */
const peek = stack.peek();
console.log('堆疊頂端元素 peek = ' + peek);

/* 從堆疊彈出元素 */
const pop = stack.pop();
console.log('彈出的元素 pop = ' + pop + '，彈出後 stack = ' + stack.toArray());

/* 取得堆疊長度 */
const size = stack.size;
console.log('堆疊長度 size = ' + size);

/* 判斷堆疊是否為空 */
const isEmpty = stack.isEmpty();
console.log('堆疊是否為空 = ' + isEmpty);
