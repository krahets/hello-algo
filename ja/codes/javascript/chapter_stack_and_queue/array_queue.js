/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 循環配列を使ったキュー */
class ArrayQueue {
    #nums; // キューの要素を格納する配列
    #front = 0; // キューの先頭要素を指すインデックス
    #queSize = 0; // キューの要素数

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* キューの容量を取得する */
    get capacity() {
        return this.#nums.length;
    }

    /* キューの要素数を取得する */
    get size() {
        return this.#queSize;
    }

    /* キューが空かどうかを判定する */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* エンキューする */
    push(num) {
        if (this.size === this.capacity) {
            console.log('キューが満杯です');
            return;
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        const rear = (this.#front + this.size) % this.capacity;
        // num をキューの末尾に追加する
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* デキューする */
    pop() {
        const num = this.peek();
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    peek() {
        if (this.isEmpty()) throw new Error('キューが空です');
        return this.#nums[this.#front];
    }

    /* 配列を返す */
    toArray() {
        // キューの要素数に当たる範囲だけを変換する
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* 実行例 */
/* キューを初期化する */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 要素をキューに追加する */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue =', queue.toArray());

/* キューの先頭要素を参照する */
const peek = queue.peek();
console.log('先頭要素 peek = ' + peek);

/* キューから要素を取り出す */
const pop = queue.pop();
console.log('デキューした要素 pop = ' + pop + '、デキュー後の queue =', queue.toArray());

/* キューの要素数を取得する */
const size = queue.size;
console.log('キューの要素数 size = ' + size);

/* キューが空かどうかを判定する */
const isEmpty = queue.isEmpty();
console.log('キューは空か = ' + isEmpty);

/* 循環配列の動作を確認する */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('第 ' + i + ' 回のエンキューとデキューを終えた後の queue =', queue.toArray());
}
