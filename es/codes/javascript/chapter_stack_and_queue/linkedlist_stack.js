/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 基于链表实现的栈 */
class LinkedListStack {
    #stackPeek; // 将头节点作为栈顶
    #stkSize = 0; // 栈的长度

    constructor() {
        this.#stackPeek = null;
    }

    /* 获取栈的长度 */
    get size() {
        return this.#stkSize;
    }

    /* 判断栈是否为空 */
    isEmpty() {
        return this.size === 0;
    }

    /* 入栈 */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* 出栈 */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* 访问栈顶元素 */
    peek() {
        if (!this.#stackPeek) throw new Error('栈为空');
        return this.#stackPeek.val;
    }

    /* 将链表转化为 Array 并返回 */
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

/* Driver Code */
/* 初始化栈 */
const stack = new LinkedListStack();

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('栈 stack = ' + stack.toArray());

/* 访问栈顶元素 */
const peek = stack.peek();
console.log('栈顶元素 peek = ' + peek);

/* 元素出栈 */
const pop = stack.pop();
console.log('出栈元素 pop = ' + pop + '，出栈后 stack = ' + stack.toArray());

/* 获取栈的长度 */
const size = stack.size;
console.log('栈的长度 size = ' + size);

/* 判断是否为空 */
const isEmpty = stack.isEmpty();
console.log('栈是否为空 = ' + isEmpty);
