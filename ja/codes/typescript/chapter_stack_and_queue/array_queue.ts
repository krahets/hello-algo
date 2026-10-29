/**
 * File: array_queue.ts
 * Created Time: 2022-12-11
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 循環配列で実装したキュー */
class ArrayQueue {
    private nums: number[]; // キューの要素を格納する配列
    private front: number; // キューの先頭要素を指す先頭ポインタ
    private queSize: number; // キューの長さ

    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = this.queSize = 0;
    }

    /* キューの容量を取得する */
    get capacity(): number {
        return this.nums.length;
    }

    /* キューの長さを取得 */
    get size(): number {
        return this.queSize;
    }

    /* キューが空か判定 */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* エンキュー */
    push(num: number): void {
        if (this.size === this.capacity) {
            console.log('キューが満杯です');
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        const rear = (this.front + this.queSize) % this.capacity;
        // num をキューの末尾に追加する
        this.nums[rear] = num;
        this.queSize++;
    }

    /* デキュー */
    pop(): number {
        const num = this.peek();
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        this.front = (this.front + 1) % this.capacity;
        this.queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    peek(): number {
        if (this.isEmpty()) throw new Error('キューが空です');
        return this.nums[this.front];
    }

    /* Array を返す */
    toArray(): number[] {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        const arr = new Array(this.size);
        for (let i = 0, j = this.front; i < this.size; i++, j++) {
            arr[i] = this.nums[j % this.capacity];
        }
        return arr;
    }
}

/* 実行用コード */
/* キューを初期化する */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 要素をエンキューする */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue =', queue.toArray());

/* キューの先頭要素にアクセス */
const peek = queue.peek();
console.log('キューの先頭要素 peek = ' + peek);

/* 要素をデキューする */
const pop = queue.pop();
console.log('デキューした要素 pop = ' + pop + '、デキュー後 queue =', queue.toArray());

/* キューの長さを取得 */
const size = queue.size;
console.log('キューの長さ size = ' + size);

/* キューが空か判定 */
const isEmpty = queue.isEmpty();
console.log('キューは空か = ' + isEmpty);

/* 循環配列をテストする */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('第 ' + i + ' 回のエンキューとデキューの後 queue =', queue.toArray());
}

export {};
