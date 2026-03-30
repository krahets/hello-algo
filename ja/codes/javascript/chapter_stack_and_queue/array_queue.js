/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 循環配列ベースのキュー */
class ArrayQueue {
    #nums; // キュー要素を格納する配列
    #front = 0; // 先頭ポインタ。先頭要素を指す
    #queSize = 0; // キューの長さ

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* キューの容量を取得 */
    get capacity() {
        return this.#nums.length;
    }

    /* キューの長さを取得 */
    get size() {
        return this.#queSize;
    }

    /* キューが空かどうかを判定 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* エンキュー */
    push(num) {
        if (this.size === this.capacity) {
            console.log('キューがいっぱいです');
            return;
        }
        // 末尾ポインタを計算し、末尾インデックス + 1 を指す
        // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        const rear = (this.#front + this.size) % this.capacity;
        // num をキュー末尾に追加
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* デキュー */
    pop() {
        const num = this.peek();
        // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
    peek() {
        if (this.isEmpty()) throw new Error('キューが空です');
        return this.#nums[this.#front];
    }

    /* Array を返す */
    toArray() {
        // 有効長の範囲内のリスト要素のみを変換
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* キューを初期化 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 要素をエンキュー */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue =', queue.toArray());

/* キュー先頭の要素にアクセス */
const peek = queue.peek();
console.log('先頭要素 peek = ' + peek);

/* 要素をデキュー */
const pop = queue.pop();
console.log('取り出した要素 pop = ' + pop + '、取り出した後 queue =', queue.toArray());

/* キューの長さを取得 */
const size = queue.size;
console.log('キューの長さ size = ' + size);

/* キューが空かどうかを判定 */
const isEmpty = queue.isEmpty();
console.log('キューは空か = ' + isEmpty);

/* 循環配列をテストする */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('第 ' + i + ' 回エンキュー + デキュー後 queue =', queue.toArray());
}
