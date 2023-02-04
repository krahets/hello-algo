/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

class DequeNode {
    prev;   // 前驱结点引用 (指针)
    next;   // 后继结点引用 (指针)
    val;    // 结点值
    
    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
    head;   // 头结点 head
    tail;   // 尾结点 tail
    len;    // 双向队列的长度

    constructor() {
        this.head = null;
        this.tail = null;
        this.len = 0;
    }

    /* 队尾入队操作 */
    pushBack(val) {
        const node = new DequeNode(val);
        // 若链表为空，则令 head, tail 都指向 node
        if (this.len === 0) {
            this.head = node;
            this.tail = node;
        } else {
            // 将 node 添加至链表尾部
            this.tail.next = node;
            node.prev = this.tail;
            this.tail = node; // 更新尾结点
        }
        this.len++;
    }

    /* 队首入队操作 */
    pushFront(val) {
        const node = new DequeNode(val);
        // 若链表为空，则令 head, tail 都指向 node
        if (this.len === 0) {
            this.head = node;
            this.tail = node;
        } else {
            // 将 node 添加至链表头部
            this.head.prev = node;
            node.next = this.head;
            this.head = node; // 更新头结点
        }
        this.len++;
    }

    /* 队尾出队操作 */
    popBack() {
        if (this.len === 0) {
            return null;
        }
        const value = this.tail.val; // 存储尾结点值
        // 删除尾结点
        let temp = this.tail.prev;
        if (temp !== null) {
            temp.next = null;
            this.tail.prev = null;
        }
        this.tail = temp;   // 更新尾结点
        this.len--;
        return value;
    }

    /* 队首出队操作 */
    popFront() {
        if (this.len === 0) {
            return null;
        }
        const value = this.head.val; // 存储尾结点值
        // 删除头结点
        let temp = this.head.next;
        if (temp !== null) {
            temp.prev = null;
            this.head.next = null;
        }
        this.head = temp;   // 更新头结点
        this.len--;
        return value;
    }

    /* 访问队尾元素 */
    peekLast() {
        return this.len === 0 ? null : this.tail.val;
    }

    /* 访问队首元素 */
    peekFirst() {
        return this.len === 0 ? null : this.head.val;
    }

    /* 获取双向队列的长度 */
    size() {
        return this.len;
    }

    /* 判断双向队列是否为空 */
    isEmpty() {
        return this.len === 0;
    }

    /* 打印双向队列 */
    print() {
        const arr = [];
        let temp = this.head;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log("[" + arr.join(", ") + "]");
    }
}

/* 初始化双向队列 */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushBack(3);
linkedListDeque.pushBack(2);
linkedListDeque.pushBack(5);
console.log("双向队列 linkedListDeque = ");
linkedListDeque.print();

/* 访问元素 */
const peekFirst = linkedListDeque.peekFirst();
console.log("队首元素 peekFirst = " + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log("队尾元素 peekLast = " + peekLast);

/* 元素入队 */
linkedListDeque.pushBack(4);
console.log("元素 4 队尾入队后 linkedListDeque = ");
linkedListDeque.print();
linkedListDeque.pushFront(1);
console.log("元素 1 队首入队后 linkedListDeque = ");
linkedListDeque.print();

/* 元素出队 */
const popBack = linkedListDeque.popBack();
console.log("队尾出队元素 = " + popBack + "，队尾出队后 linkedListDeque = ");
linkedListDeque.print();
const popFront = linkedListDeque.popFront();
console.log("队首出队元素 = " + popFront + "，队首出队后 linkedListDeque = ");
linkedListDeque.print();

/* 获取双向队列的长度 */
const size = linkedListDeque.size();
console.log("双向队列长度 size = " + size);

/* 判断双向队列是否为空 */
const isEmpty = linkedListDeque.isEmpty();
console.log("双向队列是否为空 = " + isEmpty);
