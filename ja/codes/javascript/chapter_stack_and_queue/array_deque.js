/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 循環配列で実装した両端キュー */
class ArrayDeque {
    #nums; // 両端キューの要素を格納する配列
    #front; // キューの先頭要素を指す先頭ポインタ
    #queSize; // 両端キューの長さ

    /* コンストラクタ */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* 両端キューの容量を取得する */
    capacity() {
        return this.#nums.length;
    }

    /* 両端キューの長さを取得する */
    size() {
        return this.#queSize;
    }

    /* 両端キューが空かどうかを判定する */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 循環配列のインデックスを計算する */
    index(i) {
        // 剰余演算を使い、配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら、先頭に戻る
        // i が配列の先頭を越えたら、末尾に戻る
        return (i + this.capacity()) % this.capacity();
    }

    /* 先頭にエンキューする */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('両端キューが満杯です');
            return;
        }
        // 先頭ポインタを左に 1 つ移動する
        // 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        this.#front = this.index(this.#front - 1);
        // num をキューの先頭に追加する
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* 末尾にエンキューする */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('両端キューが満杯です');
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        const rear = this.index(this.#front + this.#queSize);
        // num をキューの末尾に追加する
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 先頭からデキューする */
    popFirst() {
        const num = this.peekFirst();
        // 先頭ポインタを後ろに 1 つ移動する
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* 末尾からデキューする */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    peekFirst() {
        if (this.isEmpty()) throw new Error('両端キューが空です。');
        return this.#nums[this.#front];
    }

    /* キューの末尾要素にアクセスする */
    peekLast() {
        if (this.isEmpty()) throw new Error('両端キューが空です。');
        // 末尾要素のインデックスを計算する
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* 表示用の配列を返す */
    toArray() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* 実行用コード */
/* 両端キューを初期化する */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('両端キュー deque = [' + deque.toArray() + ']');

/* 要素にアクセスする */
const peekFirst = deque.peekFirst();
console.log('キューの先頭要素 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('キューの末尾要素 peekLast = ' + peekLast);

/* 要素をエンキューする */
deque.pushLast(4);
console.log('要素 4 を末尾にエンキューした後 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('要素 1 を先頭にエンキューした後 deque = [' + deque.toArray() + ']');

/* 要素をデキューする */
const popLast = deque.popLast();
console.log(
    '末尾からデキューした要素 = ' +
        popLast +
        '、末尾からデキューした後 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '先頭からデキューした要素 = ' +
        popFirst +
        '、先頭からデキューした後 deque = [' +
        deque.toArray() +
        ']'
);

/* 両端キューの長さを取得する */
const size = deque.size();
console.log('両端キューの長さ size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty = deque.isEmpty();
console.log('両端キューは空か = ' + isEmpty);
