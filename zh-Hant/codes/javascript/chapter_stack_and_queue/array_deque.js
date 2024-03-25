/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 基於環形陣列實現的雙向佇列 */
class ArrayDeque {
    #nums; // 用於儲存雙向佇列元素的陣列
    #front; // 佇列首指標，指向佇列首元素
    #queSize; // 雙向佇列長度

    /* 建構子 */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* 獲取雙向佇列的容量 */
    capacity() {
        return this.#nums.length;
    }

    /* 獲取雙向佇列的長度 */
    size() {
        return this.#queSize;
    }

    /* 判斷雙向佇列是否為空 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 計算環形陣列索引 */
    index(i) {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        return (i + this.capacity()) % this.capacity();
    }

    /* 佇列首入列 */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('雙向佇列已滿');
            return;
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        this.#front = this.index(this.#front - 1);
        // 將 num 新增至佇列首
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* 佇列尾入列 */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('雙向佇列已滿');
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        const rear = this.index(this.#front + this.#queSize);
        // 將 num 新增至佇列尾
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 佇列首出列 */
    popFirst() {
        const num = this.peekFirst();
        // 佇列首指標向後移動一位
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* 佇列尾出列 */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* 訪問佇列尾元素 */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // 計算尾元素索引
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* 返回陣列用於列印 */
    toArray() {
        // 僅轉換有效長度範圍內的串列元素
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* 初始化雙向佇列 */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('雙向佇列 deque = [' + deque.toArray() + ']');

/* 訪問元素 */
const peekFirst = deque.peekFirst();
console.log('佇列首元素 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('佇列尾元素 peekLast = ' + peekLast);

/* 元素入列 */
deque.pushLast(4);
console.log('元素 4 佇列尾入列後 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('元素 1 佇列首入列後 deque = [' + deque.toArray() + ']');

/* 元素出列 */
const popLast = deque.popLast();
console.log(
    '佇列尾出列元素 = ' +
        popLast +
        '，佇列尾出列後 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '佇列首出列元素 = ' +
        popFirst +
        '，佇列首出列後 deque = [' +
        deque.toArray() +
        ']'
);

/* 獲取雙向佇列的長度 */
const size = deque.size();
console.log('雙向佇列長度 size = ' + size);

/* 判斷雙向佇列是否為空 */
const isEmpty = deque.isEmpty();
console.log('雙向佇列是否為空 = ' + isEmpty);
