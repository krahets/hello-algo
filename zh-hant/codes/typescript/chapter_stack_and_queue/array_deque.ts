/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 以環狀陣列實作雙端佇列 */
class ArrayDeque {
    private nums: number[]; // 存放雙端佇列元素的陣列
    private front: number; // 隊首索引，記錄隊首元素在陣列中的位置
    private queSize: number; // 雙端佇列長度

    /* 建構子 */
    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = 0;
        this.queSize = 0;
    }

    /* 取得雙端佇列容量 */
    capacity(): number {
        return this.nums.length;
    }

    /* 取得雙端佇列長度 */
    size(): number {
        return this.queSize;
    }

    /* 判斷雙端佇列是否為空 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 計算環狀陣列的索引 */
    index(i: number): number {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        return (i + this.capacity()) % this.capacity();
    }

    /* 從隊首加入元素 */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('雙端佇列已滿');
            return;
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        this.front = this.index(this.front - 1);
        // 將 num 加到隊首
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* 從隊尾加入元素 */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('雙端佇列已滿');
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        const rear: number = this.index(this.front + this.queSize);
        // 將 num 加到隊尾
        this.nums[rear] = num;
        this.queSize++;
    }

    /* 從隊首取出元素 */
    popFirst(): number {
        const num: number = this.peekFirst();
        // 將隊首索引往後移一格
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* 從隊尾取出元素 */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.nums[this.front];
    }

    /* 讀取隊尾元素 */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // 計算隊尾元素的索引
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* 回傳陣列以便輸出 */
    toArray(): number[] {
        // 只轉換雙端佇列中實際存放的元素
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* 範例程式 */
/* 初始化雙端佇列 */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('雙端佇列 deque = [' + deque.toArray() + ']');

/* 讀取隊首與隊尾元素 */
const peekFirst = deque.peekFirst();
console.log('隊首元素 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('隊尾元素 peekLast = ' + peekLast);

/* 將元素加入雙端佇列 */
deque.pushLast(4);
console.log('將元素 4 加到隊尾後 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('將元素 1 加到隊首後 deque = [' + deque.toArray() + ']');

/* 從雙端佇列取出元素 */
const popLast = deque.popLast();
console.log(
    '從隊尾取出的元素 = ' +
        popLast +
        '，從隊尾取出後 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '從隊首取出的元素 = ' +
        popFirst +
        '，從隊首取出後 deque = [' +
        deque.toArray() +
        ']'
);

/* 取得雙端佇列長度 */
const size = deque.size();
console.log('雙端佇列長度 size = ' + size);

/* 判斷雙端佇列是否為空 */
const isEmpty = deque.isEmpty();
console.log('雙端佇列是否為空 = ' + isEmpty);

export {};
