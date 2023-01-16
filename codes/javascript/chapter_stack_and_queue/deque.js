/**
 * File: deque.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 基于数组方法实现的双端队列 */
class Deque {
    array;
    len;
    constructor() {
        this.len = 0;
        this.array = [];
    }

    /* 在队尾添加元素 */
    pushBack(value) {
        this.array.push(value);
        this.len++;
    }

    /* 在队首添加元素 */
    pushFront(value) {
        this.array.unshift(value);
        this.len++;
    }

    /* 删除队尾元素 */
    popBack() {
        this.len--;
        return this.array.pop();
    }

    /* 删除队首元素 */
    popFront() {
        this.len--;
        return this.array.shift();
    }

    /* 访问队尾元素 */
    peekLast() {
        return this.array[this.len - 1];
    }

    /* 访问队首元素 */
    peekFirst() {
        return this.array[0];
    }

    /* 判断队列是否为空 */
    isEmpty() {
        return this.len === 0;
    }

    /* 获取队列的长度 */
    size() {
        return this.len;
    }

    /* 打印队列 */
    printDeque() {
        let str = '';
        for (let i = 0; i < this.array.length; i++) {
            str += this.array[i];
            if (i < this.array.length - 1) str += ', ';
        }
        console.log(str);
    };

}

/* 初始化双向队列 */
const deque = new Deque();

/* 元素入队 */
deque.pushBack(2);
deque.pushBack(5);
deque.pushBack(4);
deque.pushFront(3);
deque.pushFront(1);
console.log("双向队列 deque = ");
deque.printDeque();

/* 访问元素 */
const peekFirst = deque.peekFirst();
console.log("队首元素 peekFirst = " + peekFirst);
const peekLast = deque.peekLast();
console.log("队尾元素 peekLast = " + peekLast);

/* 元素出队 */
const popFront = deque.popFront();
console.log("队首出队元素 popFront = " + popFront + "，队首出队后 deque = ");
deque.printDeque();
const popBack = deque.popBack();
console.log("队尾出队元素 popBack = " + popBack + "，队尾出队后 deque = ");
deque.printDeque();

/* 获取双向队列的长度 */
const size = deque.size();
console.log("双向队列长度 size = " + size);

/* 判断双向队列是否为空 */
const isEmpty = deque.isEmpty();
console.log("双向队列是否为空 = " + isEmpty);