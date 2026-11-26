/**
 * File: array_queue.ts
 * Created Time: 2022-12-11
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 以環狀陣列實作佇列 */
class ArrayQueue {
    private nums: number[]; // 存放佇列元素的陣列
    private front: number; // 隊首索引，記錄隊首元素在陣列中的位置
    private queSize: number; // 佇列長度

    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = this.queSize = 0;
    }

    /* 取得佇列容量 */
    get capacity(): number {
        return this.nums.length;
    }

    /* 取得佇列長度 */
    get size(): number {
        return this.queSize;
    }

    /* 判斷佇列是否為空 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 入隊 */
    push(num: number): void {
        if (this.size === this.capacity) {
            console.log('佇列已滿');
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        const rear = (this.front + this.queSize) % this.capacity;
        // 將 num 加到隊尾
        this.nums[rear] = num;
        this.queSize++;
    }

    /* 出隊 */
    pop(): number {
        const num = this.peek();
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        this.front = (this.front + 1) % this.capacity;
        this.queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    peek(): number {
        if (this.isEmpty()) throw new Error('佇列為空');
        return this.nums[this.front];
    }

    /* 回傳陣列 */
    toArray(): number[] {
        // 只轉換佇列中實際存放的元素
        const arr = new Array(this.size);
        for (let i = 0, j = this.front; i < this.size; i++, j++) {
            arr[i] = this.nums[j % this.capacity];
        }
        return arr;
    }
}

/* 範例程式 */
/* 初始化佇列 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 將元素加入佇列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('佇列 queue =', queue.toArray());

/* 讀取隊首元素 */
const peek = queue.peek();
console.log('隊首元素 peek = ' + peek);

/* 從佇列取出元素 */
const pop = queue.pop();
console.log('出隊元素 pop = ' + pop + '，出隊後 queue =', queue.toArray());

/* 取得佇列長度 */
const size = queue.size;
console.log('佇列長度 size = ' + size);

/* 判斷佇列是否為空 */
const isEmpty = queue.isEmpty();
console.log('佇列是否為空 = ' + isEmpty);

/* 測試環狀陣列 */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('第 ' + i + ' 輪入隊 + 出隊後 queue =', queue.toArray());
}

export {};
