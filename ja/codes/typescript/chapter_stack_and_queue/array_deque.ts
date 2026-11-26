/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 循環配列を使った両端キュー */
class ArrayDeque {
    private nums: number[]; // 両端キューの要素を格納する配列
    private front: number; // 両端キューの先頭要素を指すインデックス
    private queSize: number; // 両端キューの要素数

    /* コンストラクタ */
    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = 0;
        this.queSize = 0;
    }

    /* 両端キューの容量を取得する */
    capacity(): number {
        return this.nums.length;
    }

    /* 両端キューの要素数を取得する */
    size(): number {
        return this.queSize;
    }

    /* 両端キューが空かどうかを判定する */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* 循環配列のインデックスを求める */
    index(i: number): number {
        // 剰余を使って配列の先頭と末尾をつなぐ
        // i が配列の末尾を越えたら先頭に戻る
        // i が配列の先頭より前に出たら末尾に回る
        return (i + this.capacity()) % this.capacity();
    }

    /* 先頭に追加する */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('両端キューが満杯です');
            return;
        }
        // 先頭のインデックスを左に 1 つ移す
        // 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        this.front = this.index(this.front - 1);
        // num を両端キューの先頭に追加する
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* 末尾に追加する */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('両端キューが満杯です');
            return;
        }
        // 両端キューの末尾要素の次の位置を示すインデックスを求める
        const rear: number = this.index(this.front + this.queSize);
        // num を両端キューの末尾に追加する
        this.nums[rear] = num;
        this.queSize++;
    }

    /* 先頭から取り出す */
    popFirst(): number {
        const num: number = this.peekFirst();
        // 先頭のインデックスを 1 つ進める
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* 末尾から取り出す */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* 両端キューの先頭要素を参照する */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('両端キューが空です。');
        return this.nums[this.front];
    }

    /* 両端キューの末尾要素を参照する */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('両端キューが空です。');
        // 末尾要素のインデックスを求める
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* 表示用の配列を返す */
    toArray(): number[] {
        // 両端キューの要素数に当たる範囲だけを変換する
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* 実行例 */
/* 両端キューを初期化する */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('両端キュー deque = [' + deque.toArray() + ']');

/* 要素を参照する */
const peekFirst = deque.peekFirst();
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('末尾要素 peekLast = ' + peekLast);

/* 要素を両端キューに追加する */
deque.pushLast(4);
console.log('末尾に 4 を追加した後の deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('先頭に 1 を追加した後の deque = [' + deque.toArray() + ']');

/* 両端キューから要素を取り出す */
const popLast = deque.popLast();
console.log(
    '末尾から取り出した要素 = ' +
        popLast +
        '、末尾から取り出した後の deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '先頭から取り出した要素 = ' +
        popFirst +
        '、先頭から取り出した後の deque = [' +
        deque.toArray() +
        ']'
);

/* 両端キューの要素数を取得する */
const size = deque.size();
console.log('両端キューの要素数 size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty = deque.isEmpty();
console.log('両端キューは空か = ' + isEmpty);

export {};
