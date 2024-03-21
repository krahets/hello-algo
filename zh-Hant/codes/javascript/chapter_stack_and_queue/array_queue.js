/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 基於環形陣列實現的佇列 */
class ArrayQueue {
    #nums; // 用於儲存佇列元素的陣列
    #front = 0; // 佇列首指標，指向佇列首元素
    #queSize = 0; // 佇列長度

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* 獲取佇列的容量 */
    get capacity() {
        return this.#nums.length;
    }

    /* 獲取佇列的長度 */
    get size() {
        return this.#queSize;
    }

    /* 判斷佇列是否為空 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 入列 */
    push(num) {
        if (this.size === this.capacity) {
            console.log('佇列已滿');
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        const rear = (this.#front + this.size) % this.capacity;
        // 將 num 新增至佇列尾
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 出列 */
    pop() {
        const num = this.peek();
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    peek() {
        if (this.isEmpty()) throw new Error('佇列為空');
        return this.#nums[this.#front];
    }

    /* 返回 Array */
    toArray() {
        // 僅轉換有效長度範圍內的串列元素
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* 初始化佇列 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 元素入列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('佇列 queue =', queue.toArray());

/* 訪問佇列首元素 */
const peek = queue.peek();
console.log('佇列首元素 peek = ' + peek);

/* 元素出列 */
const pop = queue.pop();
console.log('出列元素 pop = ' + pop + '，出列後 queue =', queue.toArray());

/* 獲取佇列的長度 */
const size = queue.size;
console.log('佇列長度 size = ' + size);

/* 判斷佇列是否為空 */
const isEmpty = queue.isEmpty();
console.log('佇列是否為空 = ' + isEmpty);

/* 測試環形陣列 */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('第 ' + i + ' 輪入列 + 出列後 queue =', queue.toArray());
}
