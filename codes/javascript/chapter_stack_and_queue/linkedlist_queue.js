/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 基于链表实现的队列 */
class LinkedListQueue {
    #front; // 头节点 #front
    #rear; // 尾节点 #rear
    #queSize = 0;

    constructor() {
        this.#front = null;
        this.#rear = null;
    }

    /* 获取队列的长度 */
    get size() {
        return this.#queSize;
    }

    /* 判断队列是否为空 */
    isEmpty() {
        return this.size === 0;
    }

    /* 入队 */
    push(num) {
        // 在尾节点后添加 num
        const node = new ListNode(num);
        // 如果队列为空，则令头、尾节点都指向该节点
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // 如果队列不为空，则将该节点添加到尾节点后
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* 出队 */
    pop() {
        const num = this.peek();
        // 删除头节点
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* 访问队首元素 */
    peek() {
        if (this.size === 0) throw new Error('队列为空');
        return this.#front.val;
    }

    /* 将链表转化为 Array 并返回 */
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
/* 初始化队列 */
const queue = new LinkedListQueue();

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('队列 queue = ' + queue.toArray());

/* 访问队首元素 */
const peek = queue.peek();
console.log('队首元素 peek = ' + peek);

/* 元素出队 */
const pop = queue.pop();
console.log('出队元素 pop = ' + pop + '，出队后 queue = ' + queue.toArray());

/* 获取队列的长度 */
const size = queue.size;
console.log('队列长度 size = ' + size);

/* 判断队列是否为空 */
const isEmpty = queue.isEmpty();
console.log('队列是否为空 = ' + isEmpty);
