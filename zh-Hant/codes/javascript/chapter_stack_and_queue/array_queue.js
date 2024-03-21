/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 基于环形数组实现的队列 */
class ArrayQueue {
    #nums; // 用于存储队列元素的数组
    #front = 0; // 队首指针，指向队首元素
    #queSize = 0; // 队列长度

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* 获取队列的容量 */
    get capacity() {
        return this.#nums.length;
    }

    /* 获取队列的长度 */
    get size() {
        return this.#queSize;
    }

    /* 判断队列是否为空 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 入队 */
    push(num) {
        if (this.size === this.capacity) {
            console.log('队列已满');
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        const rear = (this.#front + this.size) % this.capacity;
        // 将 num 添加至队尾
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 出队 */
    pop() {
        const num = this.peek();
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* 访问队首元素 */
    peek() {
        if (this.isEmpty()) throw new Error('队列为空');
        return this.#nums[this.#front];
    }

    /* 返回 Array */
    toArray() {
        // 仅转换有效长度范围内的列表元素
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* 初始化队列 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('队列 queue =', queue.toArray());

/* 访问队首元素 */
const peek = queue.peek();
console.log('队首元素 peek = ' + peek);

/* 元素出队 */
const pop = queue.pop();
console.log('出队元素 pop = ' + pop + '，出队后 queue =', queue.toArray());

/* 获取队列的长度 */
const size = queue.size;
console.log('队列长度 size = ' + size);

/* 判断队列是否为空 */
const isEmpty = queue.isEmpty();
console.log('队列是否为空 = ' + isEmpty);

/* 测试环形数组 */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('第 ' + i + ' 轮入队 + 出队后 queue =', queue.toArray());
}
