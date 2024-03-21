/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 基于环形数组实现的双向队列 */
class ArrayDeque {
    #nums; // 用于存储双向队列元素的数组
    #front; // 队首指针，指向队首元素
    #queSize; // 双向队列长度

    /* 构造方法 */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* 获取双向队列的容量 */
    capacity() {
        return this.#nums.length;
    }

    /* 获取双向队列的长度 */
    size() {
        return this.#queSize;
    }

    /* 判断双向队列是否为空 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 计算环形数组索引 */
    index(i) {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return (i + this.capacity()) % this.capacity();
    }

    /* 队首入队 */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('双向队列已满');
            return;
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        this.#front = this.index(this.#front - 1);
        // 将 num 添加至队首
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* 队尾入队 */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('双向队列已满');
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        const rear = this.index(this.#front + this.#queSize);
        // 将 num 添加至队尾
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 队首出队 */
    popFirst() {
        const num = this.peekFirst();
        // 队首指针向后移动一位
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* 队尾出队 */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* 访问队首元素 */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* 访问队尾元素 */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // 计算尾元素索引
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* 返回数组用于打印 */
    toArray() {
        // 仅转换有效长度范围内的列表元素
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* 初始化双向队列 */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('双向队列 deque = [' + deque.toArray() + ']');

/* 访问元素 */
const peekFirst = deque.peekFirst();
console.log('队首元素 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('队尾元素 peekLast = ' + peekLast);

/* 元素入队 */
deque.pushLast(4);
console.log('元素 4 队尾入队后 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('元素 1 队首入队后 deque = [' + deque.toArray() + ']');

/* 元素出队 */
const popLast = deque.popLast();
console.log(
    '队尾出队元素 = ' +
        popLast +
        '，队尾出队后 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '队首出队元素 = ' +
        popFirst +
        '，队首出队后 deque = [' +
        deque.toArray() +
        ']'
);

/* 获取双向队列的长度 */
const size = deque.size();
console.log('双向队列长度 size = ' + size);

/* 判断双向队列是否为空 */
const isEmpty = deque.isEmpty();
console.log('双向队列是否为空 = ' + isEmpty);
